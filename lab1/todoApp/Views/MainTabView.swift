import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            SummaryView(upcomingTasksCount: 3, overdueTasksCount: 2, highPriorityTasksCount: 1, mediumPriorityTasksCount: 2, lowPriorityTasksCount: 4)
                .tabItem {
                    Image(systemName: "chart.bar")
                    Text("Podsumowanie")
                }
            
            Text("Wszystkie")
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Wszystkie")
                }
            
            Text("Zaplanowane")
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Zaplanowane")
                }
            
            Text("Zaległe")
                .tabItem {
                    Image(systemName: "exclamationmark.triangle")
                    Text("Zaległe")
                }
                .badge(2)
                
        }
    }
}



#Preview{
    MainTabView()
}
