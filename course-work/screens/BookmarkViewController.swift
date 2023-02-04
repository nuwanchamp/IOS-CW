
import UIKit
import SnapKit
import Combine

class BookmarkViewController: UIViewController {

    let greetinSegment = GreetingViewController()
    let categorySegment = CategoryViewController()
    let foodListSegment =  FoodListTableViewController()
    let bookmarkModel = BookmarkViewModel()
    var bookmarksRef:[Recipe] = [Recipe]()
    private var subscriptions = Set<AnyCancellable>()
    
    let column:UIStackView = {
        let vStack = UIStackView()
        vStack.axis = .horizontal
        vStack.translatesAutoresizingMaskIntoConstraints = false
        return vStack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addGradientBg(self: self)
        self.view.addSubview(column)
        column.snp.makeConstraints { make in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        // ===============================================
        //    Greeting Segment
        // ===============================================
        column.addSubview(greetinSegment.view)
        greetinSegment.greeting.text = "Bookmarks"
        greetinSegment.view.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(170)
        }
        
        
        // ===============================================
        //   Category Segment
        // ===============================================
        column.addSubview(categorySegment.view)
        categorySegment.view.snp.makeConstraints { make in
            make.top.equalTo(greetinSegment.view.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview();
            make.height.equalTo(60)
        }
        
        // ===============================================
        //   Food List Segment
        // ===============================================
        column.addSubview(foodListSegment.view)
        foodListSegment.view.snp.makeConstraints { make in
            make.top.equalTo(categorySegment.view.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        foodListSegment.delegate = self
        categorySegment.delegate = self
        

        SessionManager.shared.$bookmarks
            .map{
            bookmarks in
            bookmarks.map { bookmark in
                bookmark.recipe
            }
        }
        .receive(on: DispatchQueue.main)
        .assign(to:\.foodListSegment.listOfRecipes, on: self)
        .store(in: &subscriptions)
      
       
    }
    
    func filterRecipeByCuisineId(id: Int)->[Recipe]{
        return bookmarksRef.filter { recipe in
            Int(recipe.cuisineID) == id
        }
    }

}

extension BookmarkViewController:FoodListTableViewDelegate, CategoryTabDelegate{
    func didRemoveBookmarkAt() {
        self.foodListSegment.foodList.reloadData()
    }
    
    func didSelectFoodAt(indexPath: IndexPath, recipe: Recipe) {
        self.navigationController?.pushViewController(FoodDetailedViewController(recipe:recipe), animated: true)
    }
    func categoryChanged(id: Int) {
        let filteredRecipeList = filterRecipeByCuisineId(id: id)
        print(filteredRecipeList)
        self.foodListSegment.listOfRecipes = filteredRecipeList
        self.foodListSegment.foodList.reloadData()
    }
        
    
}


