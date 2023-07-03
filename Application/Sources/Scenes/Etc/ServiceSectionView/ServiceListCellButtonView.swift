import SwiftUI

import SunshijoDesign

struct ServiceListCellButtonView: View {
    var image: Image
    var text: String
    var action: () -> Void
    var textColor: Color

    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                image
                    .resizable()
                    .frame(width: 24, height: 24)
                Text(text)
                    .sdText(type: .medium18, textColor: textColor)
                    .padding(.vertical, 13)
                Spacer()
            }
        }
    }
}
