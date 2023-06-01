import Foundation

import Moya
import RxSwift

class TimeTableRepositoryImpl: TimeTableRepository {
    private let remoteTimeTableDataSource: RemoteTimeTableDataSource

    init(remoteTimeTableDataSource: RemoteTimeTableDataSource) {
        self.remoteTimeTableDataSource = remoteTimeTableDataSource
    }
    func fetchTimeTableList(grade: Int, classNum: Int) -> RxSwift.Observable<[TimeTableEntity]> {
        remoteTimeTableDataSource.fetchTimeTableList(grade: grade, classNum: classNum)
            .asObservable()
    }
}
