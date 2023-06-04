import SwiftUI

struct LaunchScreenView: View {

    @StateObject var viewModel: LaunchScreenViewModel
    @EnvironmentObject var sunshijoRouter: SunshijoRouter

    var body: some View {
        Image("Sunshijo")
            .onChange(of: viewModel.isSuccessToRefreshToken, perform: { isSuccess in
                if isSuccess {
                    self.sunshijoRouter.presentFullScreen(.main)
                    self.viewModel.isSuccessToRefreshToken = false
                }
            })
            .onChange(of: viewModel.isFailureToRefreshToken, perform: { _ in
                self.sunshijoRouter.presentFullScreen(.login)
                self.viewModel.isFailureToRefreshToken = false
            })
            .onChange(of: self.sunshijoRouter.stack.last?.screen, perform: {
                guard $0 == .launch else { return }
                viewModel.refreshToken()
            })
            .onAppear(perform: viewModel.refreshToken)
    }
}
