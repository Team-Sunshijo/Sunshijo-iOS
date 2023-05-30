import SwiftUI

struct AuthTextField: View {
    var title: String
    var placeholeder: String
    @Binding var text: String
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.system(
                    size: 14,
                    weight: .medium
                ))
            TextField(placeholeder, text: $text)
                .frame(height: 40)
                .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
                .border(SunshijoIOSAsset.Colors.gray200.swiftUIColor, width: 1)
                .cornerRadius(5)
                .font(.system(
                    size: 12,
                    weight: .regular
                ))
        }
        .padding([.leading, .trailing], 30)
        .padding(.bottom, 25)
    }
}
