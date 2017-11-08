//
//  Cocoarreios.swift
//  Cocoarreios
//
//  Created by Murilo da Paixão on 08/11/17.
//

import Foundation
import Moya
import Result

public struct Cocoarreios {
    static let provider = MoyaProvider<CocoarreiosTarget>()
    public weak var delegate: CocoarreiosDelegate?
    
    public init() {}
    
    public static func request(_ target: CocoarreiosTarget, _ completion: @escaping (Result<Address, MoyaError>) -> Void) {
        provider.request(target) { result in
            switch result {
            case .success(let json):
                do {
                    let address = try Address.fromJSON(jsonData: json.data)
                    completion(.success(address))
                } catch {
                    completion(.failure(.jsonMapping(json)))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func request(_ target: CocoarreiosTarget) {
        Cocoarreios.request(target) { result in
            if let delegate = self.delegate {
                delegate.receivedAddress(with: result)
            }
        }
    }
}
