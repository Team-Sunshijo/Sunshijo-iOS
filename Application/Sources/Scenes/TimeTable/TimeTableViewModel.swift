import Foundation

import RxSwift
import TimeTableService

class TimeTableViewModel: ObservableObject {
    @Published var timeTable: [[TimeTableEntity]] = [[], [], [], [], [], [], []]
    let dayOfTheWeek = ["월", "화", "수", "목", "금"]
    private let fetchTimeTableListUseCase: FetchTimeTableListUseCase

    private var disposeBag = DisposeBag()

    init(fetchTimeTableListUseCase: FetchTimeTableListUseCase) {
        self.fetchTimeTableListUseCase = fetchTimeTableListUseCase
    }

    func fetchTimeTable() {
        self.fetchTimeTableListUseCase.excute(grade: 2, classNum: 2)
            .subscribe(onNext: {
                var reset: [[TimeTableEntity]] = [[], [], [], [], [], [], []]
                $0.forEach {
                    reset[$0.period-1].append($0)
                }
                self.timeTable = reset
            })
            .disposed(by: disposeBag)
    }
    func viewAppear() {
        self.timeTable = [[], [], [], [], [], [], []]
    }
}
