import Foundation

import RxSwift
import RestApiModule

protocol RemoteTimeTableDataSource: RestApiRemoteDataSource<TimeTableAPI> {
    func fetchTimeTableList(grade: Int, classNum: Int) -> Single<[TimeTableEntity]>
}
