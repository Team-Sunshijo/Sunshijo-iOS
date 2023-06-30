import SwiftUI
import SNavigationAndTab
import SunshijoDesign

struct EtcView: View, SNavigationAndTabContent {
    @EnvironmentObject var sunshijoRouter: SunshijoRouter
    @State var isLogoutButtonSheet: Bool = false
    let viewModel: EtcViewModel
    var tabInformation: TabInformation {
        TabInformation(
            tabItemText: "더보기",
            tabItemImage: .etc,
            backgroundColor: .GrayScale.gray50
        )
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Spacer().frame(height: 36)
            HStack {
                Text("더보기")
                    .sdText(type: .semiBold24, textColor: .GrayScale.gray900)
                Spacer()
            }.padding(.bottom, 20)
            VStack(spacing: 16) {
                ServiceSectionButtonView(
                    headerText: "계정",
                    services: [
                        (image: Image.profile, text: "프로필", action: {
                            self.sunshijoRouter.navigateTo(.profile)
                        }, textColor: .System.sub),
                        (image: Image.passwordCheck, text: "비밀번호 변경", action: {
                            self.sunshijoRouter.navigateTo(.editPassword)
                        }, textColor: .System.sub),
                        (image: Image.logout, text: "로그아웃", action: {
                            self.isLogoutButtonSheet = true
                        }, textColor: .System.red)
                    ]
                )
                ServiceSectionButtonView(
                    headerText: "도움말",
                    services: [
                        (image: Image.danger, text: "오류신고", action: {
                            self.sunshijoRouter.navigateTo(.errorReport)
                        }, textColor: .System.sub)
                    ]
                )
            }
            Spacer()
        }
        .padding(.horizontal, 30)
        .sdBottomSheet(isPresented: $isLogoutButtonSheet, sdBottomSheet: {
            SDBottomSheet(
                title: "계정에서 로그아웃 하시겠어요?",
                fillButton: (text: "로그아웃", action: {
                    self.viewModel.logout()
                    self.sunshijoRouter.popToRoot()
                }),
                cancelButton: (text: "취소", action: { })
            )
        })
        .onTabSelected(tabIndex: 3, perform: {
        })
    }
}
