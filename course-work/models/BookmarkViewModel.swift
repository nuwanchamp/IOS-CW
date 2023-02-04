
import Combine
import Foundation

class BookmarkViewModel:ObservableObject{
    @Published var bookmarkList:[Bookmark] = [Bookmark]()
    init(){
        fetchBookmarks()
    }
    
    func getRecipeList() -> [Int]{
        return bookmarkList.map { Bookmark in
            return Bookmark.recipe.id
        }
    }
        
    func fetchBookmarks(){
        let id = UserDefaults.standard.integer(forKey: "userId")
        let url = URL(string:"https://laravel.sentechlk.com/api/bookmarks?user=\(id)")!
        var request = URLRequest(url: url)
       
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error{
                return
            }
            
            if let data = data{
                do{
                   
                    let model = try JSONDecoder().decode(BookmarkResponse.self, from: data  )
                    self.bookmarkList = model.data
                   
                }catch{
                    print(error)
                }
            }
            
        }
        task.resume()
    }
    func addBookmark(recipe_id:Int)->AnyPublisher<BookmarkSingleResponse, Error> {
        let id = UserDefaults.standard.integer(forKey: "userId")
        var token:String  = UserDefaults.standard.string(forKey:"token" ) ??  "19|39oa1Sg4QPaGcCxa6cXQx3PFOsILPr7gNKjlbiVd" // Default user token
        let params = [
            "user_id" : String(id),
            "recipe_id" : String(recipe_id)
        ] as [String : String]
        return fetchData(url: URL(string:"https://laravel.sentechlk.com/api/bookmarks")!, method: "POST", body: params, token: token , type: BookmarkSingleResponse.self)
    }
    
    func rmBookmark(recipe_id:Int)->AnyPublisher<BookmarkDeleteResponse, Error> {
        let unwantedBookmark = SessionManager.shared.getBookmarkByRecipeId(id: recipe_id)
        let bid = unwantedBookmark != nil ? unwantedBookmark!.id : 0
        
        var token:String  = UserDefaults.standard.string(forKey:"token" ) ??  "19|39oa1Sg4QPaGcCxa6cXQx3PFOsILPr7gNKjlbiVd" // Default user token
      
        return fetchData(url: URL(string:"https://laravel.sentechlk.com/api/bookmarks/\(bid )")!, method: "DELETE", body: nil, token: token , type: BookmarkDeleteResponse.self)
    }
    
    
    func getBookmarkByRecipeId(id:Int) -> Bookmark?{
       
        let filteredBookmark = bookmarkList.filter({ $0.recipe.id == id })
        return filteredBookmark.count > 0 ? filteredBookmark[0] : nil
    }
    func removeBookmark(recipe_id: Int){
        
        // get bookmark by recipe_id
        let bmk:Bookmark? = getBookmarkByRecipeId(id: recipe_id)
        if(bmk == nil){
            return
        }
        let url = URL(string:"https://laravel.sentechlk.com/api/bookmarks/\(bmk!.id)")!
        var request = URLRequest(url: url)
        print(bmk!.id)
       
        request.httpMethod = "DELETE"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error{
                return
            }
            print(data)
            if let httpResponse = response as? HTTPURLResponse {
                    let statusCode = httpResponse.statusCode
                    print("API response status code: \(statusCode)")
                self.bookmarkList = self.bookmarkList.filter { Bookmark in
                    return Bookmark.id != bmk!.id
                }
            }
            
            
            
        }
        task.resume()
    }}
struct BookmarkResponse: Codable {
    let data: [Bookmark]
}
struct BookmarkDeleteResponse: Codable{
    let message: String
    let status: Int
}
struct BookmarkSingleResponse: Codable{
    let data: Bookmark
}

// MARK: - Datum
struct Bookmark: Codable {
    let id, recipeID: Int
    let userID:Int
    let recipe: Recipe
    let tried: String

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case recipeID = "recipe_id"
        case recipe, tried
    }
}


