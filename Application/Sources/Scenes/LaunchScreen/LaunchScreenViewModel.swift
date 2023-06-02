import SwiftUI
import AuthService
import RxSwift

class LaunchScreenViewModel: ObservableObject {

    private var disposeBag = DisposeBag()

    @Published var isSuccessToRefreshToken = false
    @Published var isFailureToRefreshToken = false

    private let refreshTokenUseCase: RefreshTokenUseCase

    init(refreshTokenUseCase: RefreshTokenUseCase) {
        self.refreshTokenUseCase = refreshTokenUseCase
    }
    func refreshToken() {
        self.isSuccessToRefreshToken = false
        self.isFailureToRefreshToken = false
        self.refreshTokenUseCase.excute()
            .subscribe(onCompleted: {
                self.isSuccessToRefreshToken = true
            }, onError: { abc in
                print(abc)
                self.isFailureToRefreshToken = true
            })
            .disposed(by: disposeBag)
    }
}
