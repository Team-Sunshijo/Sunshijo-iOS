import SwiftUI

import AuthService
import TimeTableService

class SunshijoRouterFactory: RouterFactory {

    // MARK: - View
    let launchScreenView: LaunchScreenView
    let signupView: SignupView
    let loginView: LoginView
    let profileView: ProfileView
    let editPasswordView: EditPasswordView
    let errorReportView: ErrorReportView

    // main
    let mainView: MainView
    let timeTableView: TimeTableView
    let scheduleView: ScheduleView
    let evaluationView: EvaluationView
    let etcView: EtcView

    init() {
        // Dependency
        let authServiceDependency = AuthServiceDependency.shared
        let timeTableServiceDependency = TimeTableServiceDependency.shared

        // ViewModel
        let signupViewModel = SignupViewModel(signupUseCase: authServiceDependency.signupUseCase)
        let loginViewModel = LoginViewModel(signInUseCase: authServiceDependency.signinUseCase)
        let timeTableViewModel = TimeTableViewModel(
            fetchTimeTableListUseCase: timeTableServiceDependency.fetchTimeTableListUseCase
        )
        let evaluationViewModel = EvaluationViewModel()
        let scheduleViewModel = ScheduleViewModel()
        let etcViewModel = EtcViewModel(logoutUseCase: authServiceDependency.logoutUseCase)
        let launchScreenViewModel = LaunchScreenViewModel(
            refreshTokenUseCase: authServiceDependency.refreshTokenUseCase
        )
        let profileViewModel = ProfileViewModel()
        let editPasswordViewModel = EditPasswordViewModel()
        let errorReportViewModel = ErrorReportViewModel()

        // View
        self.signupView = SignupView(viewModel: signupViewModel)
        self.loginView = LoginView(viewModel: loginViewModel)
        self.timeTableView = TimeTableView(viewModel: timeTableViewModel)
        self.scheduleView = ScheduleView(viewModel: scheduleViewModel)
        self.evaluationView = EvaluationView(viewModel: evaluationViewModel)
        self.etcView = EtcView(viewModel: etcViewModel)
        self.mainView = MainView(
            timeTableView: .init(viewModel: timeTableViewModel),
            scheduleView: .init(viewModel: scheduleViewModel),
            evaluationView: .init(viewModel: evaluationViewModel),
            etcView: .init(viewModel: etcViewModel))
        self.launchScreenView = LaunchScreenView(viewModel: launchScreenViewModel)
        self.profileView = ProfileView(viewModel: profileViewModel)
        self.editPasswordView = EditPasswordView(viewModel: editPasswordViewModel)
        self.errorReportView = ErrorReportView(viewModel: errorReportViewModel)
    }

    // swiftlint:disable cyclomatic_complexity
    @ViewBuilder func makeBody(for screen: SunshijoRoute) -> some View {
        switch screen {
        case .launch:
            launchScreenView
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
        case .profile:
            profileView
        case .editPassword:
            editPasswordView
        case .errorReport:
            errorReportView
        }
    }
    // swiftlint:enable cyclomatic_complexity
}
