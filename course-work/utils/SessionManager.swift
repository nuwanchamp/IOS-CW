//
//  SessionManager.swift
//  course-work
//
//  Created by user229897 on 2/1/23.
//

import Foundation
import Combine

class SessionManager{
    static let shared = SessionManager()
    private init(){}
    var user:User?
    @Published var bookmarks:[Bookmark] = [Bookmark]()
    private var cancellables = Set<AnyCancellable>()
}

extension SessionManager{
    func loadData(){
        // Get User data using the stored id in UserDefault
        fetchUserData().sink { completion in
            switch completion{
            case .failure(let e):
                print(e)
                break
            case .finished:
                break
            }
        } receiveValue: { userData in
            self.user = userData
        }.store(in: &cancellables)
        
        fetchBookmarkData().sink { completion in
            switch completion{
            case .failure(let e):
                print(e)
                break
            case .finished:
                break
            }
            
        } receiveValue: { bookmarkList in
            self.bookmarks = bookmarkList.data
        }.store(in: &cancellables)
    }
    func getBookmarkByRecipeId(id:Int) -> Bookmark?{
       
        let filteredBookmark = bookmarks.filter({ $0.recipe.id == id })
        return filteredBookmark.count > 0 ? filteredBookmark[0] : nil
    }
    func removeBookmarkFromListByRecipeId(recipe_id: Int){
        bookmarks = bookmarks.filter { $0.recipe.id != recipe_id }
    }
}

struct User:Codable{
    let id:Int
    let name:String
    let email:String
}
func fetchUserData() -> AnyPublisher<User, Error> {
    let url = URL(string: "https://laravel.sentechlk.com/api/me")!
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    let token = "19|39oa1Sg4QPaGcCxa6cXQx3PFOsILPr7gNKjlbiVd"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
  //  request.httpBody = try! JSONEncoder().encode(["username": username, "password": password])

    return URLSession.shared
        .dataTaskPublisher(for: request)
        .map { d, res in
            return d
        }
        .decode(type: User.self, decoder: JSONDecoder())
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
}
func fetchBookmarkData() -> AnyPublisher<BookmarkResponse, Error> {
    let user = UserDefaults.standard.integer(forKey: "userId")
    let url = URL(string: "https://laravel.sentechlk.com/api/bookmarks?user=\(user)")!
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    let token = "19|39oa1Sg4QPaGcCxa6cXQx3PFOsILPr7gNKjlbiVd"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
  //  request.httpBody = try! JSONEncoder().encode(["username": username, "password": password])

    return URLSession.shared
        .dataTaskPublisher(for: request)
        .map { d, res in
          //  print(d)
            return d
        }
        .decode(type: BookmarkResponse.self, decoder: JSONDecoder())
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
}


