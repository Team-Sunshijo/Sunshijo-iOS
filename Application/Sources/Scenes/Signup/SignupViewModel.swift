import Foundation
import AuthService
import RxSwift

class SignupViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var userId: String = ""
    @Published var password: String = ""
    @Published var validPassword: String = ""
    var signupCode: String = "DsmTeacher"
    @Published var isSuccess: Bool = false
    @Published var isDisabled: Bool = true
    private let signupUseCase: SignupUseCase
    init(signupUseCase: SignupUseCase) {
        self.signupUseCase = signupUseCase
    }

    private var disposeBag = DisposeBag()
    func signup() {
        self.signupUseCase.excute(data: .init(
            userName: name,
            userId: userId,
            signupCode: signupCode,
            password: password
        ))
        .subscribe(onCompleted: {
            self.isSuccess = true
        }, onError: { [weak self] in
            if $0.asAuthServiceError == .conflict {
                print("아이디 중복")
            } else {
                self?.isSuccess = false
            }
            self?.isSuccess = false
        }).disposed(by: disposeBag)
    }
    func checkSignup() {
        self.isDisabled = !checkId() || !checkPassword() || !isValidPassword() || !isCheckName()
    }
    func isCheckName() -> Bool {
        return name == ""
    }
    func checkId() -> Bool {
        let strRegEx = "[A-Za-z0-9]{6,20}"
        let pred = NSPredicate(format: "SELF MATCHES %@", strRegEx)
        return pred.evaluate(with: self.userId)
    }
    func checkPassword() -> Bool {
        let strRegEx = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-]).{6,30}"
        let pred = NSPredicate(format: "SELF MATCHES %@", strRegEx)
        return pred.evaluate(with: self.password)
    }
    func isValidPassword() -> Bool {
        return password == validPassword && password != ""
    }
}
