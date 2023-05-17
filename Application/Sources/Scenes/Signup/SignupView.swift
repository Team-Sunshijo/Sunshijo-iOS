import SwiftUI

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
                    .padding([.top, .bottom], 40)
                    .font(.system(size: 20, weight: .semibold))
                AuthTextField(
                    title: "이름",
                    placeholeder: "이름 입력",
                    radius: 5,
                    border: 1,
                    text: $viewModel.name
                )
                .onChange(of: viewModel.name) { _ in
                    viewModel.checkSignup()
                }
                AuthTextField(
                    title: "아이디",
                    placeholeder: "영문 숫자 6~12자",
                    radius: 5,
                    border: 1,
                    text: $viewModel.userId
                )
                .onChange(of: viewModel.userId) { _ in
                    viewModel.checkSignup()
                }
                AuthTextField(
                    title: "비밀번호",
                    placeholeder: "숫자, 영문, 특수문자 조합 최소 6자",
                    radius: 5,
                    border: 1,
                    text: $viewModel.password
                )
                .onChange(of: viewModel.password) { _ in
                    viewModel.checkSignup()
                }
                AuthTextField(
                    title: "비밀번호 확인",
                    placeholeder: "비밀번호 입력",
                    radius: 5,
                    border: 1,
                    text: $viewModel.validPassword
                )
                .onChange(of: viewModel.validPassword) { _ in
                    viewModel.checkSignup()
                }
                Spacer()
                    .frame(height: 55)
                AuthButton(
                    isDisabled: $viewModel.isDisabled,
                    buttonTitle: "회원가입",
                    action: viewModel.signup
                )
                GoToButton(title: "계정이있으신가요?", buttonTitle: "로그인하기")
                Spacer()
            }
            .onChange(of: viewModel.isSuccess, perform: { isSuccess in
                if isSuccess {
                    self.sunshijoRouter.dismissLast()
                }
            })
            .background(SunshijoIOSAsset.Colors.white.swiftUIColor)
            .cornerRadius(30)
            .edgesIgnoringSafeArea([.bottom, .top])
            .padding(.top, 125)
            .authSetShadow()
        }
    }
}
