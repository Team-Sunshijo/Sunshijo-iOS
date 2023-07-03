import SwiftUI
import AuthService
import RxSwift

class EtcViewModel: ObservableObject {

    private var disposeBag = DisposeBag()

    private let logoutUseCase: LogoutUseCase

    init(logoutUseCase: LogoutUseCase) {
        self.logoutUseCase = logoutUseCase
    }
    func logout() {
        self.logoutUseCase.excute()
            .subscribe(onCompleted: { })
            .disposed(by: disposeBag)
    }
}
