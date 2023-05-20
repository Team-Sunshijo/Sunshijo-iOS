import Foundation

enum SunshijoRoute: ScreenProtocol {
    case signup
    case login
    case main
    
    case timeTable
    case schedule
    case evaluation
    case etc

    var embedInNavigationView: Bool {
        switch self {
        case .signup, .login, .timeTable, .schedule, .evaluation, .etc:
            return false
        default:
            return true
        }
    }

}
