import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "Sunshijo-iOS",
    organizationName: sunshijoOrganizationName,

    targets: [
        Target(
            name: "Sunshijo-iOS",
            platform: .iOS,
            product: .app,
            bundleId: "com.KODOMO",
            deploymentTarget: .iOS(
                targetVersion: "15.0",
                devices: .iphone
            ),
            infoPlist: .file(path: Path("SupportingFiles/Info.plist")),
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            scripts: [.swiftLintScript],
            dependencies: [
                .Module.KeychainModule,
                .Service.AuthService,
                .Service.TimeTableService,
                .Module.SDateUtil,
                .Module.SNavigationAndTab,
                .Module.RestApiModule
            ])
    ]
)
