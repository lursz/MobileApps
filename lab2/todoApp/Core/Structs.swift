import Foundation;


struct ToDo: Identifiable {
    var id = UUID()
    var title: String
    var desc: String
    var priority: Priority
    var date: Date
    var deadline: Date
}


enum Priority {
    case low
    case normal
    case high
}
