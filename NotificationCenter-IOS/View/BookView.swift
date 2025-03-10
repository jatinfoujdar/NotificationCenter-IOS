import SwiftUI

struct BookView: View {
    @StateObject private var networkManager = NetworkManager()
    
    func requestNotification(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]){success , error in
            if success {
                print("Permission granted")
            } else if let error = error {
                print("Error requesting permission: \(error.localizedDescription)")
            }
        }
    }

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
            }
            .padding()
            .navigationTitle("Books")
            .onAppear{
                requestNotification()
            }
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
