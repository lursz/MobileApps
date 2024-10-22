import SwiftUI

struct OverdueTasksView: View {
    @Binding var toDos: [ToDo]

    var body: some View {
        ToDoListView(toDos: .constant(overdueTasks))
    }

    private var overdueTasks: [ToDo] {
        toDos.filter { $0.deadline < Date() }
    }
}

#Preview {
    OverdueTasksView(toDos: .constant(
        [ToDo(
            title: "Stellar task",
            desc: "Keep grinding.",
            priority: .high,
            date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!,
            deadline: Calendar.current.date(byAdding: .day, value: -1, to: Date())! // This task is overdue
        ),
         ToDo(
             title: "Stellar task",
             desc: "Nice mate.",
             priority: .high,
             date: Calendar.current.date(byAdding: .day, value: 1, to: Date())!,
             deadline: Calendar.current.date(byAdding: .day, value: 3, to: Date())!
         )]))
}
