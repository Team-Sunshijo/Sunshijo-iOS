import Foundation
import RxSwift

class LoginViewModel: ObservableObject {
    @Published var userId: String = ""
    @Published var password: String = ""
}
