import SwiftUI
import RxSwift
class ErrorReportViewModel: ObservableObject {
    @Published var errorReport: String = ""
    private var disposebag = DisposeBag()

}
