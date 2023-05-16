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
}
