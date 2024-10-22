import SwiftUI

struct SummaryView: View {
    @Binding var toDos: [ToDo]
    
    private var upcomingTasksCount: Int {
        toDos.filter { Calendar.current.isDate($0.date, inSameDayAs: Date()) || $0.date > Date() }.count
    }
    private var overdueTasksCount: Int {
        toDos.filter { $0.deadline < Date() }.count
    }
    private var highPriorityTasksCount: Int {
        toDos.filter { $0.priority == .high }.count
    }
    private var mediumPriorityTasksCount: Int {
        toDos.filter { $0.priority == .normal }.count
    }
    private var lowPriorityTasksCount: Int {
        toDos.filter { $0.priority == .low }.count
    }

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("BackgroundTop"), Color("BackgoundBottom")]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea() // ignore notch
            
            VStack {
                Text("Podsumowanie")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()

                VStack(spacing: 20) {
                    Text("Taski")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    TaskCategoryView(title: "Nadchodzące", count: upcomingTasksCount, color: .blue)
                    TaskCategoryView(title: "Zaległe", count: overdueTasksCount, color: .red)
                    Text("Priorytety")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    VStack {
                        TaskCategoryView(title: "Wysoki priorytet", count: highPriorityTasksCount, color: Color("HighPriority"))
                        TaskCategoryView(title: "Średni priorytet", count: mediumPriorityTasksCount, color: Color("NormalPriority"))
                        TaskCategoryView(title: "Niski priorytet", count: lowPriorityTasksCount, color: Color("LowPriority"))
                    }
                }
                .padding()
                .background(Color("BgPill"))
                .cornerRadius(15)
                .padding()
            }
        }
    }
}

struct TaskCategoryView: View {
    var title: String
    var count: Int
    var color: Color

    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(color.opacity(0.3))
            .frame(height: 70)
            .overlay(
                HStack {
                    Text(title)
                        .font(.headline)
                    Spacer()
                    Text("\(count)")
                        .font(.title)
                        .fontWeight(.bold)
                }
                .padding()
            )
    }
}

#Preview {
    SummaryView(toDos: .constant(
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
             date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, // Overdue task
             deadline: Calendar.current.date(byAdding: .day, value: -1, to: Date())!
         )])
    )
}
