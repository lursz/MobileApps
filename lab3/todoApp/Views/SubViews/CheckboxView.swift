import SwiftUI

struct CheckBoxView: View {
    var todo: ToDo
    
    var body: some View {
        Image(systemName: todo.checkbox ? "checkmark.square.fill" : "square")
            .foregroundColor(todo.checkbox ? Color("CheckboxFill") : .gray)
            .onTapGesture {
                todo.checkbox.toggle()
            }
    }
}
