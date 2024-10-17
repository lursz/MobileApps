struct ToDoListView: View {
    @Binding var toDos: [ToDo]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(toDos, id: \.title) { todo in
                    TaskCardView(todo: todo)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ToDoListView(toDos: .constant([
        ToDo(title: "Stellar task", desc: "Keep grinding.", priority: .high, date: Date(), deadline: Calendar.current.date(byAdding: .day, value: 2, to: Date())!),
        ToDo(title: "Read book", desc: "Read 30 pages", priority: .normal, date: Date(), deadline: Calendar.current.date(byAdding: .day, value: -1, to: Date())!),
        ToDo(title: "Go to gym", desc: "Upper body workout", priority: .low, date: Date(), deadline: Calendar.current.date(byAdding: .day, value: 3, to: Date())!)
    ]))
}
