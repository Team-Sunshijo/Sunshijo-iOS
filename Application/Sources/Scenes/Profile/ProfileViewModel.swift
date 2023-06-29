import SwiftUI
import RxSwift
class ProfileViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var userId: String = ""
    @Published var classNum: String = ""
    private var disposebag = DisposeBag()

}
