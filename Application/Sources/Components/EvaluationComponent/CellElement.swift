import SwiftUI

struct CellElement: View {
    var title: String
    var teacher: String
    var detailText: String
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 10) {
                Text(title)
                    .font(.system(size: 16, weight: .semibold))
                    .padding(.top, 10)
                Text(teacher)
                    .font(.system(size: 10, weight: .regular))
                    .padding(.top, 8)
                Spacer()
            }
            Text(detailText)
                .font(.system(size: 12, weight: .regular))
            Spacer()
        }
    }
}
