
import SwiftUI
import SwiftData
struct ToDoListView: View {
    @Environment(\.modelContext) private var context
    @Query var toDos: [ToDo]
    
    let filterType: FiterType
    
    func addTask(){
        switch filterType {
        case .neither:
            context.insert(ToDo(title: "", desc: "", priority: .normal))
        case .overdue:
            context.insert(ToDo(title: "Overdue task", desc: "", priority: .low, date: Calendar.current.date(byAdding: .day, value: -2, to: Date()), deadline: Calendar.current.date(byAdding: .day, value: -2, to: Date())))
        case .incoming:
            context.insert(ToDo(title: "Incoming task", desc: "", priority: .low, date: Calendar.current.date(byAdding: .day, value: 2, to: Date()), deadline: Calendar.current.date(byAdding: .day, value: 2, to: Date())))
        }

    }
    
    
    var body: some View {
        NavigationSplitView{
            List{
                ForEach(toDos) { ToDo_ in
//                    toDo_ in TaskCardView(todo: toDo_)
                    NavigationLink{
                        Text(ToDo_.title)
                    } label:{
                        TaskCardView(todo: ToDo_)
                    }
                }
            }
            .task {
                context.insert(ToDo(title: "Stellar task", desc: "Let's gooo", priority: .normal))
            }
            .toolbar{
                ToolbarItem{
                    Button("Add", systemImage: "plus.app", action: addTask)
                }
            }
        } detail: {}
    }
}



#Preview {
    ToDoListView(filterType: .neither)
        .modelContainer(for: [ToDo.self])
}