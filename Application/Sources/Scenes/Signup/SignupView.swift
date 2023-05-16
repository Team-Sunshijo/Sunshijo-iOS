import SwiftUI

struct SignupView: View {
    @EnvironmentObject var sunshijoRouter: SunshijoRouter
    @StateObject var viewModel: SignupViewModel
    var body: some View {
        ZStack {
            VStack {
                Image("Sunshijo")
                    .padding(.top, 98)
                Spacer()
            }
            VStack {
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
                AuthTextField(
                    title: "아이디",
                    placeholeder: "아이디 입력",
                    radius: 5,
                    border: 1,
                    text: $viewModel.userId
                )
                AuthTextField(
                    title: "비밀번호",
                    placeholeder: "비밀번호 입력",
                    radius: 5,
                    border: 1,
                    text: $viewModel.password
                )
                AuthTextField(
                    title: "비밀번호 확인",
                    placeholeder: "비밀번호 입력",
                    radius: 5,
                    border: 1,
                    text: $viewModel.validPassword
                )
                AuthButton(
                    buttonTitle: "회원가입하기",
                    action: viewModel.signup
                )
                .padding(.top, 55)
                LoginButton(buttonTitle: "로그인하기")
                Spacer()
            }
            .background(SunshijoIOSAsset.Colors.white.swiftUIColor)
            .cornerRadius(30)
            .edgesIgnoringSafeArea([.bottom, .top])
            .padding(.top, 125)
            .authSetShadow()
            .onChange(of: viewModel.isSuccess, perform: { isSuccess in
                if isSuccess {
                    self.sunshijoRouter.dismissLast()
                }
            })
        }
    }
}
