import Foundation
import Moya

enum JokesService {
    case random
}

extension JokesService: TargetType {
    var baseURL: URL { return URL(string: "https://api.icndb.com")! }
    
    var path: String {
        switch self {
        case .random:
            return "jokes/random/1"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var parameters: [String: Any]? {
        return nil
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    var sampleData: Data {
        switch self {
        case .random:
            guard let url = Bundle.main.url(forResource: "jokes", withExtension: "json"),
                let data = try? Data(contentsOf: url) else {
                    return Data()
            }
            return data
        }
    }
    
    var task: Task {
        return .request
    }
}
