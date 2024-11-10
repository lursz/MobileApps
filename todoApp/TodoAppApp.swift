//
//  todoAppApp.swift
//  todoApp
//
//  Created by lukoszr lukoszr on 14/10/2024.
//

import SwiftUI
import SwiftData


@main
struct todoAppApp: App {
    @State var toDos: [ToDo] = []
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
        .modelContainer(for: ToDo.self)
    }
}
