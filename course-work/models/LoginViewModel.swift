
import Combine
import Foundation

class LoginViewModel:ObservableObject{
    @Published var title = "Remember me"
    @Published var errorBag = [String]()
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var token = ""
    
    
    func login(){
        
        let url = URL(string: "https://laravel.sentechlk.com/api/login")!
        var request = URLRequest(url: url)
        let params = [
            "email" : email,
            "password" : password
        ] as [String : Any]

        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: params, options: []) else { return }
        request.httpBody = httpBody
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error{
                print("Something went wrong")
                return
            }
            
            if let data = data{
                do{
                   
                    let model = try JSONDecoder().decode(LoginResponse.self, from: data  )
                    self.token = model.token
                    UserDefaults.standard.set(true, forKey: "isLoggedIn")
                    UserDefaults.standard.set(model.token, forKey: "token")
                }catch{
                    print(error)
                }
            }
            
        }
        task.resume()
    }
    
    func register(){
        let url = URL(string: "https://laravel.sentechlk.com/api/users")!
        var request = URLRequest(url: url)
        let params = [
            "name" : name,
            "email" : email,
            "password" : password
        ] as [String : Any]
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: params, options: []) else { return }
        request.httpBody = httpBody
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error{
                print("Something went wrong")
                return
            }
            
            if let data = data{
                do{
                   
                    let model = try JSONDecoder().decode(RegisterResponse.self, from: data  )
                    UserDefaults.standard.set(model.name, forKey: "name")
                    UserDefaults.standard.set(model.email, forKey: "email")
                    
                }catch{
                    print(error)
                }
            }
            
        }
        task.resume()    }
    
    
    
    
}
struct LoginResponse:Codable{
    let error:Int8
    let id:Int32
    let token:String
}
struct RegisterResponse:Codable{
    let name:String
        let email:String
    let id:Int
}
