import SwiftUI
import RxSwift
import AuthService

class LoginViewModel: ObservableObject {
    @Published var userId: String = ""
    @Published var password: String = ""
    @Published var isLoginSuccess: Bool = false

    private let signInUseCase: SigninUseCase
    private var disposebag = DisposeBag()
    init(
        signInUseCase: SigninUseCase
    ) {
        self.signInUseCase = signInUseCase
    }
    func login() {
        signInUseCase.excute(
            data: .init(
                id: userId,
                password: password
            ))
        .subscribe(onCompleted: { [weak self] in
            self?.isLoginSuccess = true
            print("asd")
        }, onError: { [weak self] in
            self?.isLoginSuccess = false
            print($0)
        }).disposed(by: disposebag)
    }
    func textFieldIsEmpty() -> Bool {
        return userId.isEmpty || password.isEmpty
    }
}
