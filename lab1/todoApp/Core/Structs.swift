import Foundation;


struct ToDo {
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
