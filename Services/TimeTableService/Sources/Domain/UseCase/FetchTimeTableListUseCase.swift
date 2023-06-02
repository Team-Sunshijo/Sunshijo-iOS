import Foundation

import RxSwift

public class FetchTimeTableListUseCase {

    private let repository: TimeTableRepository

    init(repository: TimeTableRepository) {
        self.repository = repository
    }

    public func excute(grade: Int, classNum: Int) -> Observable<[TimeTableEntity]> {
        return repository.fetchTimeTableList(grade: grade, classNum: classNum)
            .map { $0.sorted(by: {$0.period < $1.period }) }
    }

}
