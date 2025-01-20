//
//  CS4261_ToDoList_AppApp.swift
//  CS4261 ToDoList App
//
//  Created by Yeongbin Kim on 1/19/25.
//

import FirebaseCore
import SwiftUI

@main
struct CS4261_ToDoList_AppApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
