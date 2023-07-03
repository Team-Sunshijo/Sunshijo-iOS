import SwiftUI
import SunshijoDesign

struct ProfileView: View {
    @StateObject var viewModel: ProfileViewModel
    var body: some View {
        VStack(spacing: 0) {
            Spacer().frame(height: 20)
            Text("프로필")
                .sdText(type: .semiBold18, textColor: .GrayScale.black)
                .padding(10)
            Image.profile
                .resizable()
                .frame(width: 80, height: 80)
                .cornerRadius(40)
                .scaledToFit()
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.GrayScale.gray600, lineWidth: 1.5)
                )
                .padding(10)
            Spacer().frame(height: 64)
            SDTextField(
                title: "이름",
                placeholder: "이름을 입력해주세요.",
                text: $viewModel.name,
                borderColor: .Primary.main
            )
            SDTextField(
                title: "아이디",
                placeholder: "아이디를 입력해주세요.",
                text: $viewModel.userId,
                borderColor: .Primary.main
            )
            SDTextField(
                title: "학년 반",
                placeholder: "학년 반을 입력해주세요.",
                text: $viewModel.classNum,
                borderColor: .Primary.main
            )
            Spacer()
        }
        .navigationBarBackButtonHidden()
        .setNavigationBackButtonWithRouter()
    }
}
