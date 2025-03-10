import SwiftUI

struct BookView: View {
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Text("Total Books:")
                    Text("1")
                }
                Spacer()
            }.padding()
                .navigationTitle("Books")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        NavigationLink("Add Book", destination: {
                            BookDetailView()
                        })
                    }
                }
        }
    }
}

#Preview {
    BookView()
}
