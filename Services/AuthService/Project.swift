import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    name: "AuthService",
    platform: .iOS,
    dependencies: [
        .SPM.RxSwift,
        .SPM.Moya,
        .SPM.RxMoya
    ])
