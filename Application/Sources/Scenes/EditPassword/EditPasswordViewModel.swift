import SwiftUI
import RxSwift
class EditPasswordViewModel: ObservableObject {
    @Published var currentPassword: String = ""
    @Published var newPassword: String = ""
    @Published var newPasswordCheck: String = ""
    private var disposebag = DisposeBag()

}
