import SwiftUI

struct MainTabView: View {
    @Binding var ToDos: [ToDo]
    
    private var overdueCount: Int {
        ToDos.filter { $0.deadline < Date() }.count
    }
    private var upcomingCount: Int {
        ToDos.filter { $0.deadline >= Date() }.count
    }
    
    var body: some View {
        TabView {
            SummaryView(toDos: $ToDos)
                .tabItem {
                    Image(systemName: "chart.bar")
                    Text("Podsumowanie")
                }
            
            Text("Wszystkie")
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Wszystkie")
                }
            
            UpcomingTasksView(toDos: $ToDos)
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Zaplanowane")
                }
                .badge(upcomingCount)
            
            OverdueTasksView(toDos: $ToDos)
                .tabItem {
                    Image(systemName: "exclamationmark.triangle")
                    Text("Zaległe")
                }
                .badge(overdueCount)
                
        }
    }
}



#Preview{
    MainTabView(ToDos: .constant(
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
             date: Calendar.current.date(byAdding: .day, value: 2, to: Date())!,
             deadline: Calendar.current.date(byAdding: .day, value: 5, to: Date())!
         ),
         ToDo(
             title: "Stellar task",
             desc: "Nice mate.",
             priority: .high,
             date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!,
             deadline: Calendar.current.date(byAdding: .day, value: -5, to: Date())!
         )
        ]))
}
