import SwiftUI

import AuthService

class SunshijoRouterFactory: RouterFactory {

    // MARK: - View
    let signupView: SignupView
    let loginView: LoginView

    // main
    let mainView: MainView
    let timeTableView: TimeTableView
    let scheduleView: ScheduleView
    let evaluationView: EvaluationView
    let etcView: EtcView

    init() {
        let authServiceDependency = AuthServiceDependency.shared
        let signupViewModel = SignupViewModel(signupUseCase: authServiceDependency.signupUseCase)
        self.signupView = SignupView(viewModel: signupViewModel)
        let loginViewModel = LoginViewModel(signInUseCase: authServiceDependency.signinUseCase)
        self.loginView = LoginView(viewModel: loginViewModel)
        let timeTableViewModel = TimeTableViewModel()
        let evaluationViewModel = EvaluationViewModel()
        let scheduleViewModel = ScheduleViewModel()
        let etcViewModel = EtcViewModel()

        self.timeTableView = TimeTableView(viewModel: timeTableViewModel)
        self.scheduleView = ScheduleView(viewModel: scheduleViewModel)
        self.evaluationView = EvaluationView(viewModel: evaluationViewModel)
        self.etcView = EtcView(viewModel: etcViewModel)

        self.mainView = MainView(
            timeTableView: .init(viewModel: timeTableViewModel),
            scheduleView: .init(viewModel: scheduleViewModel),
            evaluationView: .init(viewModel: evaluationViewModel),
            etcView: .init(viewModel: etcViewModel))
    }

    @ViewBuilder func makeBody(for screen: SunshijoRoute) -> some View {
        switch screen {
        case .signup:
            signupView
        case .login:
            loginView
        case .main:
            mainView
        case .timeTable:
            timeTableView
        case .schedule:
            scheduleView
        case .evaluation:
            evaluationView
        case .etc:
            etcView
        }
    }
}
