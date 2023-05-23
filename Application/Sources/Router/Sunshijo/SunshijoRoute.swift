import Foundation

enum SunshijoRoute: ScreenProtocol {
    case signup
    case login
    case main
    // Tabbar
    case timeTable
    case schedule
    case evaluation
    case etc

    var embedInNavigationView: Bool {
        switch self {
        case .signup, .login, .evaluation, .etc, .schedule, .timeTable:
            return false
        default:
            return true
        }
    }

}
