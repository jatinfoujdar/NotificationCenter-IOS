import SwiftUI

struct BookView: View {
    @StateObject private var networkManager = NetworkManager()

    var body: some View {
        NavigationStack {
            VStack {
                List(networkManager.books) { book in
                    HStack {
                        Text(book.title)
                            .foregroundColor(.gray)
                    }
                }
                HStack {
                    Text("Total Books: \(networkManager.getBookCount())")
                    Spacer()
                }
                Spacer()
                // Add more UI for book list display if needed, for now, we can just display the count
            }
            .padding()
            .navigationTitle("Books")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink("Add Book", destination: {
                        BookDetailView(networkManager: networkManager)
                    })
                }
            }
        }
    }
}

#Preview {
    BookView()
}
