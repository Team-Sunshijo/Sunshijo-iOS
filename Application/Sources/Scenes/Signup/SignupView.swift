import SwiftUI
import SunshijoDesign
struct SignupView: View {
    @EnvironmentObject var sunshijoRouter: SunshijoRouter
    @StateObject var viewModel: SignupViewModel
    var body: some View {
        ZStack {
            VStack {
                Image("Sunshijo")
                Spacer()
            }
            .padding(.top, 51)
            VStack(spacing: 0) {
                Text("회원가입")
                    .sdText(type: .semiBold20)
                    .padding([.top, .bottom], 40)
                SDTextField(
                    title: "이름",
                    placeholder: "이름 입력",
                    text: $viewModel.name
                )
                .onChange(of: viewModel.name) { _ in
                    viewModel.checkSignup()
                }
                SDTextField(
                    title: "아이디",
                    placeholder: "영문 숫자 6~12자",
                    text: $viewModel.userId
                )
                .onChange(of: viewModel.userId) { _ in
                    viewModel.checkSignup()
                }
                SDTextField(
                    title: "비밀번호",
                    placeholder: "숫자, 영문, 특수문자 조합 최소 6자",
                    text: $viewModel.password
                )
                .onChange(of: viewModel.password) { _ in
                    viewModel.checkSignup()
                }
                SDTextField(
                    title: "비밀번호 확인",
                    placeholder: "비밀번호 입력",
                    text: $viewModel.validPassword
                )
                .onChange(of: viewModel.validPassword) { _ in
                    viewModel.checkSignup()
                }
                Spacer()
                    .frame(height: 55)
                AuthButton(
                    isDisabled: $viewModel.isDisabled,
                    text: "회원가입",
                    action: viewModel.signup
                )
                GoToButton(title: "계정이있으신가요?", buttonTitle: "로그인하기", action: {
                    self.sunshijoRouter.dismissLast()
                })
                Spacer()
            }
            .onChange(of: viewModel.isSuccess, perform: { isSuccess in
                if isSuccess {
                    self.sunshijoRouter.dismissLast()
                }
            })
            .background(Color.white)
            .cornerRadius(30)
            .edgesIgnoringSafeArea([.bottom, .top])
            .padding(.top, 125)
            .shadow(color: .authShadow, radius: 10, x: 0, y: -4)
        }
    }
}
