import SwiftUI
import SwiftData

struct UpcomingTasksView: View {
    @Query var toDos: [ToDo]

    var body: some View {
        ToDoListView(filterType: .incoming)
    }

    private var upcomingTasks: [ToDo] {
        toDos.filter {
            if let date = $0.date {
                return Calendar.current.isDate(date, inSameDayAs: Date()) || date > Date()
            }
            return false
        }
    }

}
