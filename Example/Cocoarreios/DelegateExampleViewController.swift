//
//  DelegateExampleViewController.swift
//  Cocoarreios_Example
//
//  Created by Murilo da Paixão on 08/11/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import Cocoarreios
import Result
import Moya

class DelegateExampleViewController: UIViewController {
    
    var cocoarreios = Cocoarreios()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cocoarreios.delegate = self
        cocoarreios.request(.address(cep: "60861190"))
    }
}

extension DelegateExampleViewController: CocoarreiosDelegate {
    func receivedAddress(with result: Result<Address, MoyaError>) {
        switch result {
        case .success(let address):
            print(address.cep)
            print(address.publicPlace)
            print(address.complement)
            print(address.neighborhood)
            print(address.city)
            print(address.state)
            print(address.unity)
            print(address.ibge)
            print(address.gia)
            
        case .failure(let error):
            print(error)
        }
    }
}
