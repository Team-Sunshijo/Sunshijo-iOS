import SwiftUI
import SunshijoDesign

struct EditPasswordView: View {
    @StateObject var viewModel: EditPasswordViewModel
    var body: some View {
        VStack(spacing: 0) {
            Spacer().frame(height: 20)
            Text("비밀번호 변경")
                .sdText(type: .semiBold18, textColor: .GrayScale.black)
                .padding(30)
            SDTextField(
                title: "현재 비밀번호",
                placeholder: "현재 비밀번호를 입력해주세요.",
                text: $viewModel.currentPassword,
                borderColor: .Primary.main
            )
            SDTextField(
                title: "새 비밀번호",
                placeholder: "숫자, 영문, 특수문자 조합 최소 6자.",
                text: $viewModel.newPassword,
                borderColor: .Primary.main
            )
            SDTextField(
                title: "새 비밀번호 확인",
                placeholder: "새 비밀번호를 재입력해주세요.",
                text: $viewModel.newPasswordCheck,
                borderColor: .Primary.main
            )
            Spacer()
        }
        .navigationBarBackButtonHidden()
        .setNavigationBackButtonWithRouter()
    }
}
