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
    
    @State private var isPresentingAddTask = false
    @State private var selectedToDo: ToDo?

    private func deleteToDos(at offsets: IndexSet) {
        for index in offsets {
            let todo = filteredToDos[index]
            context.delete(todo)
        }
        try? context.save()
    }
    
    var body: some View {
        NavigationSplitView {
            List(selection: $selectedToDo) {
                ForEach(filteredToDos) { todo in
                    NavigationLink(value: todo) {
                        TaskCardView(todo: todo)
                    }
                }
                .onDelete(perform: deleteToDos)
            }
            .navigationTitle("To-Do List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isPresentingAddTask = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isPresentingAddTask) {
                AddTaskView(isPresented: $isPresentingAddTask)
            }
        } detail: {
            if let todo = selectedToDo {
                ToDoDetailView(todo: todo)
            } else {
                Text("Select a task")
            }
        }
    }
}
