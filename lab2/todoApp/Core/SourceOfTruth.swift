    @State private var toDos: [ToDo] = [
        ToDo(title: "Stellar task", desc: "Keep grinding.", priority: .high, date: Date(), deadline: Calendar.current.date(byAdding: .day, value: 2, to: Date())!),
        ToDo(title: "Study for uni", desc: "Read 30 pages", priority: .normal, date: Date(), deadline: Calendar.current.date(byAdding: .day, value: -1, to: Date())!),
        ToDo(title: "Go to gym", desc: "Bench press 4x12", priority: .low, date: Date(), deadline: Calendar.current.date(byAdding: .day, value: 3, to: Date())!)
    ]