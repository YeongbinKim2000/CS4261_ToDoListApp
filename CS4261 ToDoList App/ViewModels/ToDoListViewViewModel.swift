//
//  ToDoListViewViewModel.swift
//  CS4261 ToDoList App
//
//  Created by Yeongbin Kim on 1/19/25.
//

import Foundation
import FirebaseFirestore
import OSLog

class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    private let logger = Logger()
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete() { error in
                if let error = error {
                    self.logger.error("Error deleting item: \(error.localizedDescription)")
                } else {
                    self.logger.info("Successfully deleted item with ID: \(id)")
                }
            }
    }
    
    func update(item: ToDoListItem) {
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(item.id)
            .setData([
                "title": item.title,
                "dueDate": item.dueDate,
                "createdDate": item.createdDate,
                "isDone": item.isDone
            ], merge: true) { error in
                if let error = error {
                    self.logger.error("Error updating item: \(error.localizedDescription)")
                } else {
                    self.logger.info("Successfully updated item with ID: \(item.id)")
                }
            }
    }
}
