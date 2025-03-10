import SwiftUI

struct BookDetailView: View {
    @State private var titleInput: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("Title")
                TextField("Insert title", text: $titleInput)
                    .textFieldStyle(.roundedBorder)
            }
            .padding()
            
            HStack {
                Spacer()
                Button(action: {
                    // Add action for save button here
                    print("Title saved: \(titleInput)")
                }, label: {
                    Text("Save")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                })
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    BookDetailView()
}
