//
//  ToDoListItem.swift
//  CS4261 ToDoList App
//
//  Created by Yeongbin Kim on 1/19/25.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    var id: String
    var title: String
    var dueDate: TimeInterval
    var createdDate: TimeInterval
    var isDone: Bool
    var userId: String
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
