import SwiftUI
import RxSwift
class ErrorReportViewModel: ObservableObject {
    @Published var errorReport: String = " 내용 입력"
    private var disposebag = DisposeBag()

}
