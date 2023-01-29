
import UIKit
import SnapKit

class BookmarkViewController: UIViewController {

    let greetinSegment = GreetingViewController()
    let categorySegment = CategoryViewController()
    let foodListSegment =  FoodListTableViewController()
    
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
    }
    

}

extension BookmarkViewController:FoodListTableViewDelegate{
    func didSelectFoodAt(indexPath: IndexPath, recipe: Recipe) {
        self.navigationController?.pushViewController(FoodDetailedViewController(recipe:recipe), animated: true)
    }
    
    
}


