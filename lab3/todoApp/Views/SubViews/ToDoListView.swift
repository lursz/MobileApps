import SwiftUI
import SwiftData

struct ToDoListView: View {
    @Environment(\.modelContext) private var context
    @Query var toDos: [ToDo]
    
    let filterType: FiterType
    var filteredToDos: [ToDo] {
        switch filterType {
        case .neither:
            return toDos
        case .overdue:
            return toDos.filter { ($0.deadline ?? Date()) < Date() }
        case .incoming:
            return toDos.filter { ($0.deadline ?? Date()) >= Date() }
        }
    }
    
    func addTask(){
        switch filterType {
        case .neither:
            context.insert(ToDo(title: "Just a task", desc: "Just do it!", priority: .normal))
            try! context.save()
        case .overdue:
            context.insert(ToDo(title: "Overdue task", desc: "Make your dreams come true", priority: .low, date: Calendar.current.date(byAdding: .day, value: -2, to: Date()), deadline: Calendar.current.date(byAdding: .day, value: -2, to: Date())))
        case .incoming:
            context.insert(ToDo(title: "Incoming task", desc: "make your dreams come true", priority: .low, date: Calendar.current.date(byAdding: .day, value: 2, to: Date()), deadline: Calendar.current.date(byAdding: .day, value: 2, to: Date())))
            
        }
    }
    
    
    var body: some View {
        NavigationSplitView{
            List{
                ForEach(filteredToDos) { ToDo_ in
                    NavigationLink{
                        Text(ToDo_.title)
                    } label: {
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
