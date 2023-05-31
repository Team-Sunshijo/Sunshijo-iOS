import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    name: "RestApiModule",
    platform: .iOS,
    dependencies: [
        .Service.AuthService,
        .Module.KeychainModule,
        .SPM.Moya
    ]
)
