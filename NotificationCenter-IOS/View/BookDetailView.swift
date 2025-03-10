import SwiftUI

struct BookDetailView: View {
    @State private var titleInput: String = ""
    @State private var countInput: String = "1" // Default count set to 1
    @ObservedObject var networkManager: NetworkManager

    var body: some View {
     
            HStack {
                Text("Title:")
                TextField("Insert title", text: $titleInput)
                    .textFieldStyle(.roundedBorder)
                    .padding()
            }

            
            HStack {
                Spacer()
                Button(action: {
                    // Convert countInput to an integer and add book
                    if let count = Int(countInput), !titleInput.isEmpty {
                        networkManager.addTitle(title: titleInput, count: count)
                        // After adding, reset the inputs
                        titleInput = ""
                        countInput = "1"
                    }
                }, label: {
                    Text("Save")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                })
            }
            .padding()
            .navigationTitle("Add Book")
        
    }
}
#Preview {
    BookDetailView(networkManager: NetworkManager())
}
