//
//  ViewController.swift
//  Cocoarreios
//
//  Created by pogist on 09/13/2017.
//  Copyright (c) 2017 pogist. All rights reserved.
//

import UIKit
import Cocoarreios

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Cocoarreios.request(.searchAddress(code: "60861190")) { result in
            switch result {
            case .success(let address):
                print(address)
                
            case .failure(let error):
                print(error)
            }
        }
    }
}

