import SwiftUI
import RxSwift
class ProfileViewModel: ObservableObject {
    @Published var name: String = "박도연"
    @Published var userId: String = "test1234"
    @Published var classNum: String = "2학년 2반"
    private var disposebag = DisposeBag()

}
