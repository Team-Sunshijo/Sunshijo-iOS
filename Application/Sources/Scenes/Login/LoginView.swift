import SwiftUI

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel
    var body: some View {
        ZStack {
            VStack {
                Image("Sunshijo")
                    .padding(.top, 98)
                Spacer()
            }
            VStack {
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
                AuthTextField(
                    title: "비밀번호",
                    placeholeder: "비밀번호 입력",
                    radius: 5,
                    border: 1,
                    text: $viewModel.password
                )
                .padding(.bottom, 80)
                AuthButton(
                    buttonTitle: "로그인"
                )
                SignupButton(buttonTitle: "회원가입하기")
                Spacer()
            }
            .background(SunshijoIOSAsset.Colors.white.swiftUIColor)
            .cornerRadius(30)
            .edgesIgnoringSafeArea([.bottom, .top])
            .padding(.top, 297)
            .authSetShadow()
        }
    }
}
