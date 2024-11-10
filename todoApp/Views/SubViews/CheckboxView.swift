import SwiftUI

struct CheckBoxView: View {
    var todo: ToDo
    
    var body: some View {
        Image(systemName: todo.isCompleted ? "checkmark.square.fill" : "square")
            .foregroundColor(todo.isCompleted ? Color("CheckboxFill") : .gray)
            .onTapGesture {
                todo.isCompleted.toggle()
            }
    }
}
