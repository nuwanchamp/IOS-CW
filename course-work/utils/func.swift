import UIKit
import Combine
enum APIError:Error{
    case ServerError(message: String)
    case error4xx(message: String)
    case statusCode(code:Int)
    case error422
}
func addGradientBg(self:UIViewController){
    self.view.backgroundColor = kBackgroundColor1
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = [kBackgroundColor1.cgColor, kBackgroundColor2.cgColor]
    gradientLayer.startPoint = CGPoint(x: 0, y: 0)
    gradientLayer.endPoint = CGPoint(x: 1, y: 1)
    gradientLayer.frame = self.view.bounds
    self.view.layer.insertSublayer(gradientLayer, at: 0)
}
func fetchData<T: Decodable>(url: URL, method: String?, body:[String: String]?, token: String, type: T.Type) -> AnyPublisher<T, Error> {
    var request = URLRequest(url: url)
    request.httpMethod = method ?? "GET"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
    request.httpBody = try? JSONEncoder().encode(body)

    return URLSession.shared
        .dataTaskPublisher(for: request).map({ data, response in
            print("data: \(String(data: data, encoding: .utf8))")
            return data
        })
        .decode(type: type, decoder: JSONDecoder())
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
}

func putData<T: Decodable>(url: URL, method: String?, body:[String: String]?, token: String, type: T.Type) -> AnyPublisher<T, Error> {
  var request = URLRequest(url: url)
  request.httpMethod = method ?? "GET"
  request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("application/json", forHTTPHeaderField: "Accept")
  request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
  request.httpBody = try? JSONEncoder().encode(body)

  return URLSession.shared
    .dataTaskPublisher(for: request)
    .tryMap({ data, response in
        print("respo: \(String(data: data, encoding: .utf8))")
        if let httpResponse = response as? HTTPURLResponse {
            if httpResponse.statusCode != 200 && httpResponse.statusCode != 201 {
               
                switch(httpResponse.statusCode){
                case 422:
                    throw APIError.error422
                default:
                    throw APIError.ServerError(message: httpResponse.description)
                }
            }
            
        }else{
            print("something went wrong")
        }

      return data
    })
    .decode(type: type, decoder: JSONDecoder())
    .receive(on: DispatchQueue.main)
    .eraseToAnyPublisher()
}

func createAlert(title: String, message: String, handler: ((UIAlertAction) -> Void)?) -> UIAlertController {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let OKAction = UIAlertAction(title: "OK", style: .default, handler: handler)
    alertController.addAction(OKAction)
    return alertController
}
