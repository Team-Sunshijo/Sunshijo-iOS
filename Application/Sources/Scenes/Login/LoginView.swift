import SwiftUI
import SunshijoDesign
struct LoginView: View {
    @EnvironmentObject var sunshijoRouter: SunshijoRouter
    @StateObject var viewModel: LoginViewModel
    @State var isLoginButtonDisabled: Bool = true
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Image("Sunshijo")
                    .padding(.top, 98)
                Spacer()
            }
            VStack(spacing: 0) {
                Text("로그인")
                    .sdText(type: .semiBold20)
                    .padding(.top, 40)
                SDTextField(
                    title: "아이디",
                    placeholder: "아이디 입력",
                    text: $viewModel.userId
                )
                .onChange(
                    of: viewModel.userId,
                    perform: { _ in
                        isLoginButtonDisabled = viewModel.textFieldIsEmpty()
                    })
                SDTextField(
                    title: "비밀번호",
                    placeholder: "비밀번호 입력",
                    text: $viewModel.password
                )
                .onChange(
                    of: viewModel.password,
                    perform: { _ in
                        isLoginButtonDisabled = viewModel.textFieldIsEmpty()
                    })
                .padding(.bottom, 80)
                AuthButton(
                    isDisabled: $isLoginButtonDisabled,
                    text: "로그인",
                    action: viewModel.login
                )
                GoToButton(title: "계정이없으신가요?", buttonTitle: "회원가입하기", action: {
                    self.sunshijoRouter.presentFullScreen(.signup)
                })
                Spacer()
            }
            .background(.white)
            .cornerRadius(30)
            .edgesIgnoringSafeArea([.bottom, .top])
            .padding(.top, 297)
            .shadow(color: .authShadow, radius: 10, x: 0, y: -4)
        }
        .onChange(of: viewModel.isLoginSuccess, perform: { isSuccess in
            if isSuccess {
                self.sunshijoRouter.presentFullScreen(.main)
                self.sunshijoRouter.moveTabTo(index: 0)
                self.viewModel.isLoginSuccess = false
            }
        })
    }
}
