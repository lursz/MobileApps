import SwiftUI
import SwiftData

struct SummaryView: View {
    @Query var toDos: [ToDo]
    
    private var upcomingTasksCount: Int {
        toDos.filter {
            if let date = $0.date {
                return Calendar.current.isDate(date, inSameDayAs: Date()) || date > Date()
            }
            return false
        }.count
    }

    private var overdueTasksCount: Int {
        toDos.filter {
            if let deadline = $0.deadline {
                return deadline < Date()
            }
            return false
        }.count
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
