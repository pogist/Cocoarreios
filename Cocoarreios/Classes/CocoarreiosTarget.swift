import Foundation
import Moya
import Alamofire

public enum CocoarreiosTarget {
    case searchAddress(code: String)
}

extension CocoarreiosTarget: TargetType {
    
    public var baseURL: URL {
        switch self {
        case .searchAddress(_):
            return URL(string: "https://viacep.com.br/ws")!
        }
    }
    
    public var path: String {
        switch self {
        case .searchAddress(let code):
            return "/\(code)/json/"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .searchAddress(_):
            return .get
        }
    }
    
    public var task: Task {
        switch self {
        case .searchAddress(_):
            return .requestPlain
        }
    }
    
    public var sampleData: Data {
        switch self {
        case .searchAddress(_):
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
            
        case .searchAddress(_):
            return [
                "Content-Type": "application/json",
                "Accept": "application/json"
            ]
        }
    }
}
