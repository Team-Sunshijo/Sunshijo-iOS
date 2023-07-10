import SwiftUI
import SunshijoDesign

struct EvaluationDetailView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 10) {
                Text("수학 수행평가")
                    .sdText(type: .semiBold18)
                    .padding(.top, 30)
                Text("고진영 선생님")
                    .sdText(type: .medium10)
                    .padding(.top, 37)
                Spacer()
            }
            VStack(alignment: .leading) {
                Text("1.수행평가: (sin cos 그래프 그리기 수행평가)")
                    .sdText(type: .regular12)
                Text("2.수행평가 일시: (9월, 10일, 2교시)")
                    .sdText(type: .regular12)
                Text("3.수행평가 상세내용: (함수그리기 및 수학책 30p 참조)")
                    .sdText(type: .regular12)
            }
            .padding(.top, 27)
            Spacer()
        }
    }
}
