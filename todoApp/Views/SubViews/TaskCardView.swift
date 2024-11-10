import SwiftUI
import SwiftData

struct TaskCardView: View {
    var todo: ToDo

    var body: some View {
        HStack {
            Button(action: {
                // Handle checkbox action
            }) {
                CheckBoxView(todo: todo)
            }
            VStack(alignment: .leading) {
                Text(todo.title)
                    .font(.headline)
                
                // Priority Indicator
                priorityIndicator(priority: todo.priority)
                
                // Planned Date
                if let date = todo.date {
                    Text(plannedDateText(date: date))
                        .font(.subheadline)
                }
                
                // Days until deadline
                if let deadline = todo.deadline {
                    Text(daysUntilDeadlineText(deadline: deadline))
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
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
        let taskDate = Calendar.current.startOfDay(for: date)
        let diff = Calendar.current.dateComponents([.day], from: today, to: taskDate).day ?? 0

        switch diff {
        case 0:
            return "Today"
        case 1:
            return "Tomorrow"
        case 2:
            return "Day after Tomorrow"
        default:
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "d MMMM"
            return dateFormatter.string(from: date)
        }
    }

    private func daysUntilDeadlineText(deadline: Date) -> String {
        let today = Calendar.current.startOfDay(for: Date())
        let deadlineDate = Calendar.current.startOfDay(for: deadline)
        let diff = Calendar.current.dateComponents([.day], from: today, to: deadlineDate).day ?? 0

        return diff >= 0 ? "\(diff) days left" : "Past deadline"
    }

    private func priorityColor(priority: Priority) -> Color {
        switch priority {
        case .low:
            return .green
        case .normal:
            return .yellow
        case .high:
            return .red
        }
    }
}
