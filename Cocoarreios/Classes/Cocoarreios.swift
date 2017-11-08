import Foundation
import Moya
import Alamofire

public enum Cocoarreios {
    case searchZipCode(code: String)
    
    static let provider = MoyaProvider<Cocoarreios>()
}

extension Cocoarreios: TargetType {
    
    public var baseURL: URL {
        switch self {
        case .searchZipCode(_):
            return URL(string: "https://viacep.com.br/ws")!
        }
    }
    
    public var path: String {
        switch self {
        case .searchZipCode(let code):
            return "/\(code)/json/"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .searchZipCode(_):
            return .get
        }
    }
    
    public var task: Task {
        switch self {
        case .searchZipCode(_):
            return .requestPlain
        }
    }
    
    public var sampleData: Data {
        switch self {
        case .searchZipCode(_):
            return """
            {
                "cep": "01001-000",
                "logradouro": "Praça da Sé",
                "complemento":"lado ímpar",
                "bairro":"Sé",
                "localidade":"São Paulo",
                "uf":"SP",
                "unidade":"",
                "ibge":"3550308",
                "gia":"1004"
            }
            """.data(using: .utf8)!
        }
    }
    
    public var headers: [String: String]? {
        switch self {
            
        case .searchZipCode(_):
            return [
                "Content-Type": "application/json",
                "Accept": "application/json"
            ]
        }
    }
}
