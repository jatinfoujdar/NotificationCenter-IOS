import Foundation
import UserNotifications

class NetworkManager: ObservableObject {
    @Published var books: [BookModel] = []
    
    func addTitle(title: String, count: Int) {
        let newBook = BookModel(title: title, count: count)
        books.append(newBook)

        // Schedule the local notification
        scheduleNotification(for: newBook)
    }

    func getBookCount() -> Int {
        return books.count
    }

    private func scheduleNotification(for book: BookModel) {
        let content = UNMutableNotificationContent()
        content.title = "New Book Added"
        content.body = "You have added \(book.title) to your collection."
        content.sound = .default
        
        // Trigger the notification 5 seconds after the book is added (for demo purposes)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

        // Create a request with the unique identifier
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        // Add the request to the notification center
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            }
        }
    }
}
