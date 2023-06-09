import ProjectDescription

extension Project {
    public static func framework(
        name: String,
        platform: Platform,
        infoplist: InfoPlist = .default,
        dependencies: [TargetDependency]
    ) -> Project {
        return Project(
            name: name,
            settings: nil,
            targets: [
                Target(
                    name: name,
                    platform: .iOS,
                    product: .framework,
                    bundleId: "\(sunshijoOrganizationName).\(name)",
                    deploymentTarget: .iOS(
                        targetVersion: "15.0",
                        devices: [.iphone, .ipad]
                    ),
                    infoPlist: infoplist,
                    sources: ["Sources/**"],
                    scripts: [
                        .swiftLintScript,
                        .removeStaticFrameworksScripts
                    ],
                    dependencies: dependencies
                )
            ]
        )
    }
}
