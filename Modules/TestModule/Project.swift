import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    name: "TestModule",
    platform: .iOS,
    dependencies: [
        .SPM.RxSwift
    ]
)
