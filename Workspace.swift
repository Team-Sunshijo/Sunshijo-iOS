import ProjectDescription

let workspace = Workspace(
    name: "Sunshijo_Workspace",
    projects: [
        "Application",
        "Modules/**",
        "Services/**"
    ],
    fileHeaderTemplate: nil,
    additionalFiles: []
)
