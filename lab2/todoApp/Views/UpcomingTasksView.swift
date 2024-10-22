import SwiftUI

struct UpcomingTasksView: View {
    @Binding var toDos: [ToDo]

    var body: some View {
        ToDoListView(toDos: .constant(upcomingTasks))
    }

    private var upcomingTasks: [ToDo] {
        toDos.filter { Calendar.current.isDate($0.date, inSameDayAs: Date()) || $0.date > Date() }
    }
}

#Preview {
    UpcomingTasksView(toDos: .constant(
        [ToDo(
            title: "Stellar task",
            desc: "Keep grinding.",
            priority: .high,
            date: Calendar.current.date(byAdding: .day, value: 2, to: Date())!,
            deadline: Calendar.current.date(byAdding: .day, value: 5, to: Date())!
        ),
         ToDo(
             title: "Stellar task",
             desc: "Nice mate.",
             priority: .high,
             date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, // This task is overdue
             deadline: Calendar.current.date(byAdding: .day, value: -1, to: Date())!
         )]))
}
