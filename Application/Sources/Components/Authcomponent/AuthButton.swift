import SwiftUI

struct AuthButton: View {
    @Binding var isDisabled: Bool
    var buttonTitle: String
    var action: () -> Void
    public init(
        isDisabled: Binding<Bool> = .constant(false),
        buttonTitle: String,
        action: @escaping () -> Void
    ) {
        self._isDisabled = isDisabled
        self.buttonTitle = buttonTitle
        self.action = action
    }
    var body: some View {
        VStack {
            Button(action: action) {
                Text(buttonTitle)
                    .frame(maxWidth: .infinity)
                    .padding([.top, .bottom], 10)
                    .foregroundColor(SunshijoIOSAsset.Colors.white.swiftUIColor)
                    .background(
                        isDisabled ? SunshijoIOSAsset.Colors.main700.swiftUIColor : Color.main
                    )
            }
            .cornerRadius(5)
            .frame(height: 40)
            .background(Color.white)
            .padding([.leading, .trailing], 70)
            .disabled(isDisabled)
        }
    }
}
