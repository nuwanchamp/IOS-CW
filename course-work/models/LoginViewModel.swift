
import Combine
import Foundation


class LoginViewModel:ObservableObject{
    @Published var title = "Remember me"
    @Published var errorBag = [String]()
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var token = ""
    var subscriptions = Set<AnyCancellable>()
    
    // @deprecated
    func login(){
        
        let url = URL(string: "https://laravel.sentechlk.com/api/login")!
        var request = URLRequest(url: url)
        let params = [
            "email" : email.lowercased(),
            "password" : password
        ] as [String : Any]

        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: params, options: []) else { return }
        request.httpBody = httpBody
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error{
                // Handle Errors
            }
            
            if let data = data{
                do{
                  
                    let model = try JSONDecoder().decode(LoginResponse.self, from: data  )
                    self.token = model.token
                    UserDefaults.standard.set(true, forKey: "isLoggedIn")
                    UserDefaults.standard.set(model.id, forKey: "userId")
                    UserDefaults.standard.set(model.token, forKey: "token")
                    
                }catch{
                    print(error)
                }
            }
            
        }
        task.resume()
    }
    func signIn(completion: @escaping(Bool)->Void){
        let url = URL(string: "https://laravel.sentechlk.com/api/login")!
        
        let params = [
            "email" : email.lowercased(),
            "password" : password
        ] as [String : String]
        
         putData(url: url, method: "POST", body: params, token: "", type: LoginResponse.self).receive(on: DispatchQueue.main).sink { cpm in
                switch(cpm){
                case .finished:
                    completion(true)
                    break
                case .failure(let e):
                    completion(false)
                    break
                }
            } receiveValue: { loginRsp in
                UserDefaults.standard.set(true, forKey: "isLoggedIn")
                UserDefaults.standard.set(loginRsp.id, forKey: "userId")
                UserDefaults.standard.set(loginRsp.token, forKey: "token")
                
            }.store(in: &subscriptions)
        
    }
    
    func signUp(completion: @escaping (Bool) -> Void){
        let url = URL(string: "https://laravel.sentechlk.com/api/users")!
        
        let params = [
            "name" : name,
            "email" : email.lowercased(),
            "password" : password
        ] as [String : String]
         putData(url: url, method: "POST", body: params, token: "", type: RegisterResponse.self).receive(on: DispatchQueue.main).sink { cpm in
                switch(cpm){
                case .finished:
                    completion(true)
                    break
                case .failure(let e):
                    completion(false)
                    break
                }
            } receiveValue: { registerRsp in
                UserDefaults.standard.set(registerRsp.name, forKey: "name")
                UserDefaults.standard.set(registerRsp.email, forKey: "email")
                
            }.store(in: &subscriptions)
        

    }
    // @depricated
    func register(){
        let url = URL(string: "https://laravel.sentechlk.com/api/users")!
        var request = URLRequest(url: url)
        let params = [
            "name" : name,
            "email" : email.lowercased(),
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
    let id:Int8
    let token:String
}
struct RegisterResponse:Codable{
    let name:String
        let email:String
    let id:Int
}
