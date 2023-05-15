import SwiftUI

import AuthService

class SunshijoRouterFactory: RouterFactory {

    // MARK: - View
    let signupView: SignupView

    init() {
        self.signupView = SignupView()
    }

    @ViewBuilder func makeBody(for screen: SunshijoRoute) -> some View {
        switch screen {
        case .signup:
            signupView
        }
    }
}
