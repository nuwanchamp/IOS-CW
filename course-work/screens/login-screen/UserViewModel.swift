

import Combine
import Foundation

class UserViewModel:ObservableObject{
    
    @Published var user:User
    
    init(){
        getUserData()
    }
}
func getUserData(){
    print("Getting UserData")
}

struct User{
    let id:Int;
    let bookmarks:[Int] = [Int]()
    
}
