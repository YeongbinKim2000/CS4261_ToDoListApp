//
//  EditItemView.swift
//  CS4261 ToDoList App
//
//  Created by Ethan Yan on 24/1/25.
//

import SwiftUI

struct EditItemView: View {
    let item: ToDoListItem
    @Environment(\.presentationMode) var presentationMode
    @State private var newTitle: String
    @State private var newDueDate: Date
    let onSave: (ToDoListItem) -> Void
    
    init(item: ToDoListItem, onSave: @escaping (ToDoListItem) -> Void) {
        self.item = item
        self.onSave = onSave
        self._newTitle = State(initialValue: item.title)
        self._newDueDate = State(initialValue: Date(timeIntervalSince1970: item.dueDate))
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Edit Task")) {
                    TextField("Title", text: $newTitle)
                    
                    DatePicker(
                        "Due Date",
                        selection: $newDueDate,
                        displayedComponents: [.date, .hourAndMinute]
                    )
                }
            }
            .navigationTitle("Edit Task")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        saveChanges()
                    }
                    .disabled(newTitle.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
        }
    }
    
    private func saveChanges() {
        var updatedItem = item
        updatedItem.title = newTitle.trimmingCharacters(in: .whitespaces)
        updatedItem.dueDate = newDueDate.timeIntervalSince1970
        onSave(updatedItem)
        presentationMode.wrappedValue.dismiss()
    }
}

struct EditItemView_Previews: PreviewProvider {
    static var previews: some View {
        EditItemView(
            item: ToDoListItem(
                id: "sample-id",
                title: "Sample Task",
                dueDate: Date().timeIntervalSince1970,
                createdDate: Date().timeIntervalSince1970,
                isDone: false,
                userId: "lwKHxiCBKDcEzmH1w5ow0QYetZA2"
            ),
            onSave: { _ in }
        )
    }
}
