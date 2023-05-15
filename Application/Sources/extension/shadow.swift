import SwiftUI

extension View {
    func authSetShadow(color: Color = SunshijoIOSAsset.Colors.main.swiftUIColor, radius: CGFloat = 10) -> some View {
        self.shadow(color: color, radius: radius)
    }
}
