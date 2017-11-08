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
        
        Cocoarreios.request(.address(cep: "01001000")) { result in
            switch result {
            case .success(let address):
                print(address.cep)          // => "01001-000"
                print(address.publicPlace)  // => "Praça da Sé"
                print(address.complement)   // => "lado ímpar"
                print(address.neighborhood) // => "Sé"
                print(address.city)         // => "São Paulo"
                print(address.state)        // => "SP"
                print(address.unity)        // => ""
                print(address.ibge)         // => "3550308"
                print(address.gia)          // => "1004"
                
            case .failure(let error):
                //Do something with error...
                print(error)
            }
        }
    }
}

