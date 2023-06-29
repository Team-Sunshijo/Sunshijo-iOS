import SwiftUI
import SunshijoDesign

struct ErrorReportView: View {
    @StateObject var viewModel: ErrorReportViewModel
    var body: some View {
        VStack(spacing: 0) {
            Spacer().frame(height: 20)
            Text("오류 신고")
                .sdText(type: .semiBold18, textColor: .GrayScale.black)
                .padding(10)
            TextEditor(text: $viewModel.errorReport)
                .frame(height: 500)
                .overlay {
                    RoundedRectangle(cornerRadius: 7)
                        .stroke(Color.GrayScale.gray200, lineWidth: 1)
                }
                .padding(.bottom, 15)
            HStack {
                Spacer()
                Button(action: {}, label: {
                    Text("신고하기")
                        .sdText(type: .semiBold16, textColor: .GrayScale.white)
                        .frame(width: 100, height: 40)
                })
            }
            Spacer()
        }
        .padding(.horizontal, 30)
        .navigationBarBackButtonHidden()
        .setNavigationBackButtonWithRouter()
    }
}
