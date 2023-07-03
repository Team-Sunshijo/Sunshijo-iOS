import SwiftUI

import SunshijoDesign
// swiftlint: disable large_tuple

struct ServiceSectionButtonView: View {

    var headerText: String
    var services: [(image: Image, text: String, action: () -> Void, textColor: Color)]

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(headerText)
                .sdText(type: .semiBold18, textColor: .GrayScale.gray900)
                .padding(.bottom, 10)
            ForEach(services, id: \.1) { service in
                ServiceListCellButtonView(
                    image: service.image,
                    text: service.text,
                    action: service.action,
                    textColor: service.textColor
                )
            }
        }
    }
}
// swiftlint: enable large_tuple
