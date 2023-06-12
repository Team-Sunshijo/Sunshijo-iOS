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
            .delaySubscription(.seconds(1), scheduler: MainScheduler.instance)
            .subscribe(onCompleted: {
                self.isSuccessToRefreshToken = true
            }, onError: { abc in
                print(abc)
                self.isFailureToRefreshToken = true
            })
            .disposed(by: disposeBag)
    }
}
