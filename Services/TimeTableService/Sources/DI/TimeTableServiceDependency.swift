import Foundation

public struct TimeTableServiceDependency {

    public static let shared = Self.resolve()

    public let fetchTimeTableListUseCase: FetchTimeTableListUseCase
}

extension TimeTableServiceDependency {
    static func resolve() -> TimeTableServiceDependency {
        // MARK: - Datasources
        let remoteTimeTableDataSource: RemoteTimeTableDataSource = RemoteTimeTableDataSourceImpl()

        // MARK: - Respositories
        let repository: TimeTableRepository = TimeTableRepositoryImpl(
            remoteTimeTableDataSource: remoteTimeTableDataSource
        )

        // MARK: - UseCases
        let fetchTimeTableListUseCase = FetchTimeTableListUseCase(
            repository: repository
        )

        return .init(
            fetchTimeTableListUseCase: fetchTimeTableListUseCase
        )
    }
}
