//
//  ToDoListItemView.swift
//  CS4261 ToDoList App
//
//  Created by Yeongbin Kim on 1/19/25.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
    let item: ToDoListItem
    let onSelect: (ToDoListItem) -> Void // Callback for selecting the item

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)

                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }

            Spacer()

            // Ensure the button uses a plain style to prevent interference
            Button(action: {
                viewModel.toggleIsDone(item: item)
            }) {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(Color.blue)
            }
            .buttonStyle(PlainButtonStyle()) // Prevents the button tap from propagating
        }
        .contentShape(Rectangle()) // Makes the entire row tappable
        .onTapGesture {
            onSelect(item)
        }
    }
}

#Preview {
    ToDoListItemView(
        item: ToDoListItem(
            id: "123",
            title: "Get milk",
            dueDate: Date().timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: true,
            userId: "lwKHxiCBKDcEzmH1w5ow0QYetZA2"
        )
    ) { _ in }
}