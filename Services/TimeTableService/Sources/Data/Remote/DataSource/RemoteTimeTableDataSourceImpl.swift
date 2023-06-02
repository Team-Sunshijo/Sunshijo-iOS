import Foundation

import RestApiModule
import RxSwift

class RemoteTimeTableDataSourceImpl: RestApiRemoteDataSource<TimeTableAPI>, RemoteTimeTableDataSource {
    func fetchTimeTableList(grade: Int, classNum: Int) -> RxSwift.Single<[TimeTableEntity]> {
        return request(.fetchTimeTable(grade: grade, classNum: classNum))
            .map(TimeTableListResponse.self)
            .map { $0.toDomain() }
    }
}
