import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    name: "TestService",
    platform: .iOS,
    dependencies: [
        .SPM.RxSwift
    ])
