//
//  ViewController.swift
//  Cocoarreios
//
//  Created by pogist on 09/13/2017.
//  Copyright (c) 2017 pogist. All rights reserved.
//

import UIKit
import Cocoarreios
import Moya
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let provider = MoyaProvider<Cocoarreios>()
        
        provider.request(.trackPackage(code: "JR000000000BR")) { result in
            if let error = result.error {
                print(error)
            }
            
            if let response = result.value {
                do {
                    let json = try response.mapJSON()
                    print(json)
                    print(response.statusCode)
                }
                catch let error {
                    print(error)
                }
            }
        }
    }
}

