import Foundation

enum SunshijoRoute: ScreenProtocol {
    case signup
    case login

    var embedInNavigationView: Bool {
        switch self {
        case .signup, .login:
            return false
        }
    }

}
