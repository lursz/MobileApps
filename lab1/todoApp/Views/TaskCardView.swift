import SwiftUI
struct TaskCardView: View {
        var todo: ToDo
        
        var body: some View {
            HStack {
                VStack(alignment: .leading) {
                    // Title bar
                    HStack{
                        Button(action: {
                        }) {
                            Image(systemName: "checkmark.square")
                                .foregroundColor(.blue)
                        }
                        Text(todo.title)
                            .font(.headline)
                    }

                    // Priority Indicator
                    priorityIndicator(priority: todo.priority)
                    
                    // Planned Date
                    Text(plannedDateText(date: todo.date))
                        .font(.subheadline)
                    
                    // Days until deadline
                    Text(daysUntilDeadlineText(deadline: todo.deadline))
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding()
            }
        }
        
    
        private func priorityIndicator(priority: Priority) -> some View {
            Circle()
                .fill(priorityColor(priority: priority))
                .frame(width: 10, height: 10)
        }
        

    private func plannedDateText(date: Date) -> String {
        let today = Calendar.current.startOfDay(for: Date())
        let date = Calendar.current.startOfDay(for: date)
        let diff = Calendar.current.dateComponents([.day], from: today, to: date).day ?? 0
        
        switch diff {
        case 0:
            return "Dzis"
        case 1:
            return "Jutro"
        case 2:
            return "Pojutrze"
        default:
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "d MMMM"
            
            let formattedDate = dateFormatter.string(from: date)
            
            if Calendar.current.component(.year, from: date) != Calendar.current.component(.year, from: Date()) {
                dateFormatter.dateFormat = "d MMMM yyyy"
                return dateFormatter.string(from: date)
            } else {
                return formattedDate
            }
        }
    }

    private func priorityColor(priority: Priority) -> Color {
        switch priority {
        case .high:
            return Color("HighPriority")
        case .normal:
            return Color("NormalPriority")
        case .low:
            return Color("LowPriority")
        }
    }
    

    private func daysUntilDeadlineText(deadline: Date) -> String {
        let today = Calendar.current.startOfDay(for: Date())
        let difference = Calendar.current.dateComponents([.day], from: today, to: deadline)
        let days = difference.day ?? 0
        
        if days > 0 {
            return "\(days) dni do terminu"
        } else {
            return "\(abs(days)) dni po terminie"
        }
    }
}



#Preview {
    TaskCardView(todo: ToDo(
        title: "Stellar task",
        desc: "Keep grinding.",
        priority: .high,
        date: Calendar.current.date(byAdding: .day, value: 2, to: Date())!,
        deadline: Calendar.current.date(byAdding: .day, value: 5, to: Date())!
    ))
}
