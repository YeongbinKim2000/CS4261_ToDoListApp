//
//  ToDoListItemViewViewModel.swift
//  CS4261 ToDoList App
//
//  Created by Yeongbin Kim on 1/19/25.
//

import Foundation
import FirebaseFirestore
import OSLog

class ToDoListItemViewViewModel: ObservableObject {
    private let logger = Logger()
    
    func toggleIsDone(item: ToDoListItem) {
        let db = Firestore.firestore()
        let userId = item.userId
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(item.id)
            .updateData([
                "isDone": !item.isDone
            ]) { error in
                if let error = error {
                    self.logger.error("Error toggling isDone: \(error.localizedDescription)")
                } else {
                    self.logger.info("Successfully toggled isDone for item ID: \(item.id)")
                }
            }
    }
}
