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

    init(title: String, desc: String, priority: Priority, date: Date? = nil, deadline: Date? = nil) {
        self.title = title
        self.desc = desc
        self.priority = priority
        self.date = date
        self.deadline = deadline
    }
}


enum Priority: Codable {
    case low
    case normal
    case high
}


enum FiterType{
    case neither
    case overdue
    case incoming
}