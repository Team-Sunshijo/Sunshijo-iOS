import SwiftUI
import SunshijoDesign

struct EvaluationCell: View {
    var title: String
    var teacher: String
    var detailText: String
    var dateText: String
    var body: some View {
        VStack(alignment: .leading) {
            Spacer().frame(height: 16)
            HStack(alignment: .bottom) {
                Text(title)
                    .sdText(type: .semiBold16, textColor: .GrayScale.gray900)
                Text(teacher)
                    .font(.system(size: 10, weight: .regular))
                    .foregroundColor(.GrayScale.gray700)
                    .padding(.bottom, 2)
                Spacer()
            }
            .padding(.leading, 22)
            Spacer().frame(height: 12)
            Text(detailText)
                .sdText(type: .regular12, textColor: .GrayScale.gray700)
                .padding(.leading, 22)
            HStack {
                Spacer()
                Text(dateText)
                    .sdText(type: .regular12, textColor: .GrayScale.gray700)
                    .padding(.trailing, 22)
            }
            Spacer()
        }
        .frame(height: 100)
        .background(Color.GrayScale.gray100)
        .cornerRadius(15)
        .shadow(color: .shadow, radius: 10, x: 0, y: 1)
        .padding([.leading, .trailing], 30)
    }
}
