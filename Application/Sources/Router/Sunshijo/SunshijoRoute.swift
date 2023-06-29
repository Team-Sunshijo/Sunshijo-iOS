import Foundation

enum SunshijoRoute: ScreenProtocol {

    case launch
    case signup
    case login
    case main
    case profile
    case editPassword
    case errorReport

    // Tabbar
    case timeTable
    case schedule
    case evaluation
    case etc

    var embedInNavigationView: Bool {
        switch self {
        case .launch, .signup, .login, .profile, .editPassword, .errorReport:
            return false
        default:
            return true
        }
    }

}
