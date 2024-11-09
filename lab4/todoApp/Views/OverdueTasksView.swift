import SwiftUI
import SwiftData

struct OverdueTasksView: View {
    @Query var toDos: [ToDo]

    var body: some View {
        ToDoListView(filterType: .overdue)
    }

    private var overdueTasks: [ToDo] {
        toDos.filter {
            if let deadline = $0.deadline {
                return deadline < Date()
            }
            return false
        }
    }

}
