import Foundation

class NetworkManager{
    @Published var books: [BookModel] = []
    
    func addTitle(title: String, count: Int){
        let newBook = BookModel(title: title, count: count)
        books.append(newBook)
    }
    func getBookCount() -> Int {
        return books.count
    }
    
}
