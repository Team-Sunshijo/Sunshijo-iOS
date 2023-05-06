import ProjectDescription

extension Project {
    public static func dynamicFramework(
        name: String,
        packages: [Package] = [],
        platform: Platform,
        infoplist: InfoPlist = .default,
        dependencies: [TargetDependency] = [
            .project(target: "PackageLibrary", path: "../PackageLibrary")
        ]
    ) -> Project {
        return Project(
            name: name,
            packages: packages,
            settings: nil,
            targets: [
                Target(
                    name: name,
                    platform: .iOS,
                    product: .framework,
                    bundleId: "\(sunshijoOrganizationName).\(name)",
                    deploymentTarget: .iOS(
                        targetVersion: "15.0",
                        devices: .iphone
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
