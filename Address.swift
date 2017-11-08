//
//  Address.swift
//  Cocoarreios
//
//  Created by Murilo da Paixão on 08/11/17.
//

import Foundation

public struct Address: Codable {
    let cep: String
    let publicPlace: String
    let complement: String
    let neighborhood: String
    let city: String
    let state: String
    let unity: String
    let ibge: String
    let gia: String
    
    enum CodingKeys: String, CodingKey {
        case cep
        case publicPlace = "logradouro"
        case complement = "complemento"
        case neighborhood = "bairro"
        case city = "localidade"
        case state = "uf"
        case unity = "unidade"
        case ibge
        case gia
    }
}

extension Address {
    static func fromJSON(jsonData: Data) throws -> Address {
        return try JSONDecoder().decode(Address.self, from: jsonData)
    }
}
