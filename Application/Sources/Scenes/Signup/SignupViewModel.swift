import Foundation
import RxSwift

class SignupViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var userId: String = ""
    @Published var password: String = ""
    @Published var validPassword: String = ""
}
