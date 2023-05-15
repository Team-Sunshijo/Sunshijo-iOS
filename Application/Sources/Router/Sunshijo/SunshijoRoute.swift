import Foundation

enum SunshijoRoute: ScreenProtocol {
    case signup

    var embedInNavigationView: Bool {
        switch self {
        case .signup:
            return false
        }
    }

}
