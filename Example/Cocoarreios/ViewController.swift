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

    @IBOutlet weak var cep: UILabel!
    @IBOutlet weak var publicPlace: UILabel!
    @IBOutlet weak var complement: UILabel!
    @IBOutlet weak var neighborhood: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var unity: UILabel!
    @IBOutlet weak var ibge: UILabel!
    @IBOutlet weak var gia: UILabel!
    
    @IBOutlet weak var cepTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cepTextField.delegate = self
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let cep = cepTextField.text {
            Cocoarreios.request(.address(cep: cep)) { [weak self] result in
                switch result {
                case .success(let address):
                    self?.cep.text          = address.cep
                    self?.publicPlace.text  = address.publicPlace
                    self?.complement.text   = address.complement
                    self?.neighborhood.text = address.neighborhood
                    self?.city.text         = address.city
                    self?.state.text        = address.state
                    self?.unity.text        = address.unity
                    self?.ibge.text         = address.ibge
                    self?.gia.text          = address.gia
                    
                case .failure(let error):
                    //Do something with error...
                    print(error)
                }
            }
        }
    }
}
