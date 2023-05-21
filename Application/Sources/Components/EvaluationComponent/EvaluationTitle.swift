import SwiftUI

struct EvaluationTitle: View {
    var title: String
    var count: Int
    var body: some View {
        HStack(spacing: 15) {
            Text(title)
                .font(.system(size: 24, weight: .semibold))
                .padding(.top, 45)
                .padding(.leading, 40)
            Text("\(count)")
                .padding(.top, 51)
            Spacer()
        }
    }
}
