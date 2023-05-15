import SwiftUI

import AuthService

class SunshijoRouterFactory: RouterFactory {

    // MARK: - View
    let signupView: SignupView
    let loginView: LoginView

    init() {
        let signupViewModel = SignupViewModel()
        self.signupView = SignupView(viewModel: signupViewModel)

        let loginViewModel = LoginViewModel()
        self.loginView = LoginView(viewModel: loginViewModel)
    }

    @ViewBuilder func makeBody(for screen: SunshijoRoute) -> some View {
        switch screen {
        case .signup:
            signupView
        case .login:
            loginView
        }
    }
}
