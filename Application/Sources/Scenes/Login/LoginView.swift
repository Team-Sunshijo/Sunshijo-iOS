import SwiftUI

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
                    .padding(.top, 40)
                    .font(.system(size: 20, weight: .semibold))
                AuthTextField(
                    title: "아이디",
                    placeholeder: "아이디 입력",
                    radius: 5,
                    border: 1,
                    text: $viewModel.userId
                )
                .onChange(
                    of: viewModel.userId,
                    perform: { _ in
                        isLoginButtonDisabled = viewModel.textFieldIsEmpty()
                    })
                AuthTextField(
                    title: "비밀번호",
                    placeholeder: "비밀번호 입력",
                    radius: 5,
                    border: 1,
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
                    buttonTitle: "로그인",
                    action: viewModel.login
                )
                GoToButton(title: "계정이없으신가요?", buttonTitle: "회원가입하기")
                Spacer()
            }
            .background(.white)
            .cornerRadius(30)
            .edgesIgnoringSafeArea([.bottom, .top])
            .padding(.top, 297)
            .authSetShadow()
        }
        .onChange(of: viewModel.isLoginSuccess, perform: { isSuccess in
            if isSuccess {
                self.sunshijoRouter.presentFullScreen(.signup)
                self.sunshijoRouter.moveTabTo(index: 0)
                self.viewModel.isLoginSuccess = false
            }
        })
    }
}
