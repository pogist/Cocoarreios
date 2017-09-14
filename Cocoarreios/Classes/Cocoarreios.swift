import Foundation
import Moya
import Alamofire

public enum Cocoarreios {
    case trackPackage(code: String)
}

extension Cocoarreios: TargetType {
    
    public var baseURL: URL { return URL(string: "https://webservice.correios.com.br/service/rest")! }
    
    public var path: String {
        switch self {
            
        case .trackPackage(_):
            return "/rastro/rastroMobile"
        }
    }
    
    public var method: Moya.Method {
        switch self {
            
        case .trackPackage(_):
            return .post
        }
    }
    
    public var task: Task {
        switch self {
            
        case .trackPackage(let code):
            let params = [
                "rastroObjeto": [
                    "usuario": "MobileXect",
                    "senha": "DRW0#9F$@0",
                    "tipo": "L",
                    "resultado": "U",
                    "objetos": code,
                    "lingua": "101",
                    "token": "QTXFMvu_Z-6XYezP3VbDsKBgSeljSqIysM9x"
                ]
            ]
            
            return .requestParameters(parameters: params, encoding: PropertyListEncoding.xml)
        }
    }
    
    public var sampleData: Data {
        switch self {
            
        case .trackPackage(_):
            return "".data(using: .utf8)!
        }
    }
    
    public var headers: [String: String]? {
        switch self {
        
        case .trackPackage(_):
            return ["Content-Type": "application/xml"]
        }
    }
}
