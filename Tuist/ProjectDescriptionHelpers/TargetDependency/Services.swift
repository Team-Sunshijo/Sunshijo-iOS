import ProjectDescription

extension TargetDependency {
    public struct Service {
        public static let TestService = service(name: "TestService")
    }
    
    private static func service(name: String) -> TargetDependency {
        return TargetDependency.project(
            target: name,
            path: .relativeToRoot("Services/\(name)"))
    }
}
