import Foundation

import RxSwift

public protocol TimeTableRepository {
    func fetchTimeTableList(grade: Int, classNum: Int) -> Observable<[TimeTableEntity]>

}
