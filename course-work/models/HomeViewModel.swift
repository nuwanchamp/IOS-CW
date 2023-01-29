import Combine
import Foundation

class HomeViewModel:ObservableObject{
    
    @Published var recipeList:[Recipe] = [Recipe]()
    @Published var cuisineList:[Cuisine] = [Cuisine]()
    
    func getRecipes(){
        let url = URL(string: "https://laravel.sentechlk.com/api/recipes")!
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
                   
                    let model = try JSONDecoder().decode(RecipeAPIResponse.self, from: data  )
                    self.recipeList = model.data
                }catch{
                    print(error)
                }
            }
            
        }
        task.resume()
        
    }
    func getCuisines(){
        let url = URL(string: "https://laravel.sentechlk.com/api/cuisine")!
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
                   
                    let model = try JSONDecoder().decode(CuisineAPIResponse.self, from: data  )
                    self.cuisineList = model.data
                }catch{
                    print(error)
                }
            }
            
        }
        task.resume()
        
    }
    
    
}


struct RecipeAPIResponse: Codable {
    let data: [Recipe]
}
struct CuisineAPIResponse: Codable{
    let data: [Cuisine]
}

// MARK: - Datum
struct Recipe: Codable {
    let id: Int
    let name, shortDescription, description, nutrition: String
    let ingredients, cuisineID: String
    let createdAt, updatedAt: AtedAt
    let time, calories: Int
    let image: String
    let instructions: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case shortDescription = "short_description"
        case description, nutrition, ingredients
        case cuisineID = "cuisine_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case time, calories, image, instructions
    }
}

enum AtedAt: String, Codable {
    case the20230128T052224000000Z = "2023-01-28T05:22:24.000000Z"
}

//enum Instructions: String, Codable {
    //case instructionsOneTwoThere = "Instructions one two there"
//}

struct Cuisine: Codable {
    let id: Int
    let name, code: String
    let createdAt, updatedAt: JSONNull?

    enum CodingKeys: String, CodingKey {
        case id, name, code
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
