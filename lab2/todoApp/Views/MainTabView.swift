import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            SummaryView(upcomingTasksCount: toDos.filter { $0.date > Date() }.count,
                        overdueTasksCount: toDos.filter { $0.deadline < Date() }.count,
                        highPriorityTasksCount: toDos.filter { $0.priority == .high }.count,
                        mediumPriorityTasksCount: toDos.filter { $0.priority == .normal }.count,
                        lowPriorityTasksCount: toDos.filter { $0.priority == .low }.count)
                .tabItem {
                    Image(systemName: "chart.bar")
                    Text("Podsumowanie")
                }
            
            ToDoListView(toDos: $toDos)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Wszystkie")
                }
            
            ToDoListView(toDos: $toDos.filter { $0.date >= Date() })
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Zaplanowane")
                }
            
            ToDoListView(toDos: $toDos.filter { $0.deadline < Date() })
                .tabItem {
                    Image(systemName: "exclamationmark.triangle")
                    Text("Zaległe")
                }
                .badge(toDos.filter { $0.deadline < Date() }.count)
        }
    }
}


#Preview{
    MainTabView()
}
