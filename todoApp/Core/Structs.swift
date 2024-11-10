import Foundation;
import SwiftData

@Model
class ToDo: Identifiable {
    var id = UUID()
    var title: String
    var desc: String
    var priority: Priority
    var date: Date?
    var deadline: Date?
    var isCompleted: Bool

    init(title: String, desc: String, priority: Priority, date: Date? = nil, deadline: Date? = nil) {
        self.title = title
        self.desc = desc
        self.priority = priority
        self.date = date
        self.deadline = deadline
        self.isCompleted = false
    }
}


enum Priority: String, Codable, CaseIterable {
    case low
    case normal
    case high
}


enum FiterType{
    case neither
    case overdue
    case incoming
}
