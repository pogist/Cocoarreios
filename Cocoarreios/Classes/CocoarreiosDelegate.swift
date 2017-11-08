//
//  CocoarreiosDelegate.swift
//  Cocoarreios
//
//  Created by Murilo da Paixão on 08/11/17.
//

import Foundation
import Result
import Moya

public protocol CocoarreiosDelegate: class {
    func receivedAddress(with result: Result<Address, MoyaError>) -> Void
}
