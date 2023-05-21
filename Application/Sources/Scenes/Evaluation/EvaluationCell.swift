import SwiftUI

struct EvaluationCell: View {
    var body: some View {
        CellElement(
            title: "수학 수행평가",
            teacher: "고진영 선생님",
            detailText: "그래프 그리기 수행평가 안내..."
        )
        .padding(.leading, 22)
    }
}
