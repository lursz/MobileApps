import SwiftUI
import SwiftData

struct AddTaskView: View {
    @Environment(\.modelContext) private var context
    @Binding var isPresented: Bool
    
    @State private var title: String = ""
    @State private var desc: String = ""
    @State private var priority: Priority = .normal
    @State private var date: Date = Date()
    @State private var deadline: Date = Date()
    @State private var isDateEnabled: Bool = true
    @State private var isDeadlineEnabled: Bool = true
    
    private func saveTask() {
        let newToDo = ToDo(
            title: title,
            desc: desc,
            priority: priority,
            date: isDateEnabled ? date : nil,
            deadline: isDeadlineEnabled ? deadline : nil
        )
        context.insert(newToDo)
        try? context.save()
        isPresented = false
    }
    
    var body: some View {
        NavigationView {
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
                    DatePicker("Date", selection: $date, displayedComponents: .date)
                        .disabled(!isDateEnabled)
                        .opacity(isDateEnabled ? 1.0 : 0.5)
                }
                
                Section(header: Text("Deadline")) {
                    Toggle("Enable deadline", isOn: $isDeadlineEnabled)
                    DatePicker("Deadline", selection: $deadline, displayedComponents: .date)
                        .disabled(!isDeadlineEnabled)
                        .opacity(isDeadlineEnabled ? 1.0 : 0.5)
                }
            }
            .navigationTitle("Add Task")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        saveTask()
                    }
                    .disabled(title.isEmpty)
                }
            }
        }
    }
}
