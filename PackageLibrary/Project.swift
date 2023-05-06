import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "PackageLibrary",
    platform: .iOS,
    dependencies: [
//        .SPM.RxSwift,
        .SPM.RxCocoa,
        .SPM.RxMoya,
        .SPM.Moya,
        .SPM.SnapKit,
        .SPM.Then,
        .SPM.KeychainSwift,
        .SPM.RxFlow,
        .SPM.Kingfisher,
        .SPM.SocketIO
    ]
)
