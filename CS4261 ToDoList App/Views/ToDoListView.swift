//
//  ToDoListView.swift
//  CS4261 ToDoList App
//
//  Created by Yeongbin Kim on 1/19/25.
//

import SwiftUI
import FirebaseFirestore
import OSLog

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    @State private var selectedItem: ToDoListItem? // Track the selected item for editing
    
    let logger = Logger()
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item) { selected in
                        selectedItem = selected
                    }
                    .swipeActions {
                        Button("Delete") {
                            viewModel.delete(id: item.id)
                        }
                        .tint(.red)
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(item: $selectedItem) { selectedItem in
                EditItemView(item: selectedItem) { updatedItem in
                    // Save changes to Firestore
                    viewModel.update(item: updatedItem)
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "lwKHxiCBKDcEzmH1w5ow0QYetZA2")
}
