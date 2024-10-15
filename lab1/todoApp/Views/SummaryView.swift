import SwiftUI

struct SummaryView: View {
    
    var upcomingTasksCount: Int
    var overdueTasksCount: Int
    var highPriorityTasksCount: Int
    var mediumPriorityTasksCount: Int
    var lowPriorityTasksCount: Int

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.purple.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea() // ignore notch
            
            VStack {
                Text("Podsumowanie")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()

                VStack(spacing: 20) {
                    Text("Tasks")
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


#Preview
{
    SummaryView(upcomingTasksCount: 3, overdueTasksCount: 2, highPriorityTasksCount: 1, mediumPriorityTasksCount: 2, lowPriorityTasksCount: 4)
}
