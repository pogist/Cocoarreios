//
//  Address.swift
//  Cocoarreios
//
//  Created by Murilo da Paixão on 08/11/17.
//

import Foundation

public struct Address: Codable {
    public let cep: String
    public let publicPlace: String
    public let complement: String
    public let neighborhood: String
    public let city: String
    public let state: String
    public let unity: String
    public let ibge: String
    public let gia: String
    
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
