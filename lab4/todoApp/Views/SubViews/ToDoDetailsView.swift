import SwiftUI
import SwiftData

struct ToDoDetailView: View {
    @Environment(\.modelContext) private var context
    @Environment (\.presentationMode) var presentationMode
    @Bindable var todo: ToDo
    
    init(todo: ToDo) {
        self.todo = todo
        title = todo.title
        desc = todo.desc
        priority = todo.priority
        date = todo.date ?? .now
        deadline = todo.deadline ?? .now
    }
    
    @State private var title: String
    @State private var desc: String
    @State private var priority: Priority
    @State private var date: Date
    @State private var deadline: Date
    
    @State private var isDateEnabled: Bool = true
    @State private var isDeadlineEnabled: Bool = true
    
    func saveTask() {
        todo.title = title
        todo.desc = desc
        todo.priority = priority
        
        todo.date = isDateEnabled ? date : nil
        todo.deadline = isDeadlineEnabled ? deadline : nil
        
        // Save the changes
        try? context.save()
        presentationMode.wrappedValue.dismiss()
    }
    
    var body: some View {
        Form {
            Section(header: Text("Details")) {
                TextField("Title", text: $title)
                TextEditor(text: $desc)
                    .frame(height: 100)
                Picker("Priority", selection: $priority) {
                    ForEach(Priority.allCases, id: \.self) { priority in
                        Text(priority.rawValue.capitalized).tag(priority)
                    }
                }
            }
            
            Section(header: Text("Date")) {
                Toggle("Enable date", isOn: $isDateEnabled)
                DatePicker("Date", selection: Binding<Date>(
                    get: { date },
                    set: { date = $0 }
                ), displayedComponents: .date)
                .disabled(!isDateEnabled)
                .opacity(isDateEnabled ? 1.0 : 0.5)
            }
            
            Section(header: Text("Deadline")) {
                Toggle("Enable deadline", isOn: $isDeadlineEnabled)
                DatePicker("Deadline", selection: Binding<Date>(
                    get: { deadline },
                    set: { deadline = $0 }
                ), displayedComponents: .date)
                .disabled(!isDeadlineEnabled)
                .opacity(isDeadlineEnabled ? 1.0 : 0.5)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save", systemImage: "checkmark", action: saveTask)
            }
        }
        .navigationTitle("Edit Task")
    }
}
