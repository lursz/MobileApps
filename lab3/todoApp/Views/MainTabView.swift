import SwiftUI
import SwiftData

struct MainTabView: View {
    @Environment(\.modelContext) private var context
    @Query var ToDos: [ToDo]
    
    private var overdueCount: Int {
        ToDos.filter {
            if let deadline = $0.deadline {
                return deadline < Date()
            }
            return false
        }.count
    }

    private var upcomingCount: Int {
        ToDos.filter {
            if let deadline = $0.deadline {
                return deadline >= Date()
            }
            return false
        }.count
    }

    
    var body: some View {
        TabView {
            SummaryView()
                .tabItem {
                    Image(systemName: "chart.bar")
                    Text("Podsumowanie")
                }
            
            ToDoListView(filterType: .neither)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Wszystkie")
                }
            
            UpcomingTasksView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Zaplanowane")
                }
                .badge(upcomingCount)
            
            OverdueTasksView()
                .tabItem {
                    Image(systemName: "exclamationmark.triangle")
                    Text("Zaległe")
                }
                .badge(overdueCount)
                
        }

    }
}



#Preview{
    MainTabView()
        .modelContainer(for: [ToDo.self])
}
