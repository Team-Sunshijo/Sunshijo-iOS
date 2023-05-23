import SwiftUI
import SNavigationAndTab

struct MainView: View {

    @EnvironmentObject var sunshijoRouter: SunshijoRouter
    let timeTableView: TimeTableView
    let scheduleView: ScheduleView
    let evaluationView: EvaluationView
    let etcView: EtcView
    var body: some View {
        SNavigationAndTabView(selection: $sunshijoRouter.tabBarSelection) {(
            timeTableView,
            scheduleView,
            evaluationView,
            etcView
        )}
    }
}
