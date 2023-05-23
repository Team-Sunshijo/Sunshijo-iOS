import SwiftUI

struct EvaluationCell: View {
    var title: String
    var teacher: String
    var detailText: String
    var body: some View {
        VStack(alignment: .leading) {
            Spacer().frame(height: 16)
            HStack(alignment: .bottom) {
                Text(title)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.gray900)
                Text(teacher)
                    .font(.system(size: 10, weight: .regular))
                    .foregroundColor(.gray700)
                    .padding(.bottom, 2)
                Spacer()
            }
            .padding(.leading, 22)
            Spacer().frame(height: 12)
            Text(detailText)
                .font(.system(size: 12, weight: .regular))
                .foregroundColor(.gray700)
                .padding(.leading, 22)
            Spacer()
        }
        .frame(height: 100)
        .background(Color.gray100)
        .cornerRadius(15)
        .shadow(color: .shadowColor, radius: 10, x: 0, y: 1)
        .padding([.leading, .trailing], 30)
    }
}
