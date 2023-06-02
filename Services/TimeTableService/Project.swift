import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    name: "TimeTableService",
    platform: .iOS,
    dependencies: [
        .SPM.RxSwift,
        .SPM.Moya,
        .SPM.RxMoya,
        .Module.RestApiModule,
        .Module.SDateUtil
    ])
