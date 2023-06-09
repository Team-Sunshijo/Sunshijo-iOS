import Foundation
import Moya

enum AuthAPI: TargetType {
    case signin(request: SigninRequest)
    case signup(request: SignupRequest)
    case refreshToken(refreshToken: String)
}

extension AuthAPI {

    var baseURL: URL {
        return URL(string: "http://3.36.159.7:8080")!
    }

    var path: String {
        switch self {
        case .signin:
            return "/teacher/auth"
        case .signup:
                return "/teacher/register"
        case .refreshToken:
            return "/teachers/token"
        }
    }

    var method: Moya.Method {
        switch self {
        case .signin, .signup:
            return .post
        case .refreshToken:
            return .put
        }
    }

    var task: Task {
        switch self {
        case .signin(let request):
            return .requestJSONEncodable(request)
        case .signup(let request):
            return .requestJSONEncodable(request)
        default:
            return .requestPlain
        }
    }

    var validationType: ValidationType {
        return .successCodes
    }

    var headers: [String: String]? {
        switch self {
        case .refreshToken(let refreshToken):
            return ["Refresh-Token": "Bearer \(refreshToken)", "Contect-Type": "application/json"]
        default:
            return nil
        }
    }

}
