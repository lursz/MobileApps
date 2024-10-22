
import SwiftUI
struct ToDoListView: View {
    @Binding var toDos: [ToDo]

    var body: some View {
        List{
            ForEach(toDos) {
                toDo_ in TaskCardView(todo: toDo_)
            }
        }
    }
}



#Preview {
    ToDoListView(toDos: .constant(
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
             date: Calendar.current.date(byAdding: .day, value: 2, to: Date())!,
             deadline: Calendar.current.date(byAdding: .day, value: 5, to: Date())!
         )]))
}
