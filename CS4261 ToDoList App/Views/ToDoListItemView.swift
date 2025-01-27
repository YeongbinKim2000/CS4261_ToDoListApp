import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
    let item: ToDoListItem
    let onSelect: (ToDoListItem) -> Void // Callback for selecting the item

    var body: some View {
        HStack {
            // Left stack: Title + Date
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)

                Text( "\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            // Tap on the text and spacer triggers the edit popup
            .onTapGesture {
                onSelect(item)
            }

            Spacer()

            // Right side: Checkmark button
            Button {
                // Toggle isDone without launching edit screen
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(Color.blue)
            }
            .buttonStyle(.plain)
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
            userId: "exampleUser"
        )
    ) { _ in }
}
