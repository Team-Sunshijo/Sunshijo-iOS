import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    name: "KeychainModule",
    platform: .iOS,
    dependencies: [
        .SPM.RxSwift,
        .SPM.KeychainSwift
    ]
)
