

import UIKit
import SnapKit
import Combine

protocol FoodListTableViewDelegate:AnyObject{
    func didSelectFoodAt(indexPath:IndexPath, recipe:Recipe)
    func didRemoveBookmarkAt()
}

class FoodListTableViewController: UIViewController {
    
    
    weak var delegate: FoodListTableViewDelegate?
    var navC:UINavigationController?
    @Published var listOfRecipes:[Recipe] = [Recipe]()
    @Published var isLoading = true
    var markedRecipes:[Int] = [Int]() // recipe Id List
    private var subscriptions = Set<AnyCancellable>()
    
    let foodList:UITableView = UITableView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Configure Components
        configure()
        // Set Constratints to the components
        setConstraints()
        $listOfRecipes
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.foodList.reloadData()
            }
            .store(in: &subscriptions)
        $listOfRecipes.map { _ in
            false
        }.assign(to: \.isLoading, on: self)
            .store(in: &subscriptions)
    }
    
    
     
}


extension FoodListTableViewController:UITableViewDelegate, UITableViewDataSource, FoodCardDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(listOfRecipes.count)
        
        return isLoading ? 5 : listOfRecipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(listOfRecipes.count)
        let cell:FoodListItem = tableView.dequeueReusableCell(withIdentifier: "FoodCard", for: indexPath) as! FoodListItem
        
        if(isLoading){
            
            return cell
        }
        cell.card.nav = self.navC
        cell.card.foodName.text = listOfRecipes[indexPath.row].name
        cell.card.foodDescription.text = listOfRecipes[indexPath.row].description
        cell.card.calInfo.text.text = "\(listOfRecipes[indexPath.row].calories) cal"
        cell.card.timeInfo.text.text = "\(listOfRecipes[indexPath.row].time) Mins"
        cell.card.foodImage.kf.setImage(with: URL(string:listOfRecipes[indexPath.row].image))
        cell.card.recipeId = listOfRecipes[indexPath.row].id
        cell.card.delegate = self
        if(SessionManager.shared.bookmarks.filter({ bookmark in
            bookmark.recipe.id == listOfRecipes[indexPath.row].id
        }).count > 0 ){
            cell.card.bookmaMakrBtn.isHidden = true
            cell.card.removeBookMarkBtn.isHidden = false
            
        }else{
            cell.card.bookmaMakrBtn.isHidden = false
            cell.card.removeBookMarkBtn.isHidden = true
        }
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.didSelectFoodAt(indexPath: indexPath, recipe: listOfRecipes[indexPath.row])
    }
    func didRemoveBookamrk() {
        self.foodList.reloadData()
        self.delegate?.didRemoveBookmarkAt()
    }
    func beforeAddBookmark() {
       // var alert = createAlert(title: "Error", message: "Bookmark already exists") { action in
            // No Action
       // }
      //  self.present(alert, animated: true)
    }
    func afterAddBookmark() {
        self.foodList.reloadData()
    }
    
}

extension FoodListTableViewController{
    func configure(){
        foodList.translatesAutoresizingMaskIntoConstraints = false
        foodList.backgroundColor = .clear
        foodList.dataSource = self
        foodList.delegate = self
        foodList.register(FoodListItem.self, forCellReuseIdentifier: "FoodCard")
    }
    
    func setConstraints(){
        self.view.addSubview(foodList)
        
        
        foodList.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(20)
            make.bottom.right.equalToSuperview().offset(-20)
        }
        
    }
}

class FoodListItem:UITableViewCell{
    
    
    let card:FoodCardView = {
        let card = FoodCardView()
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(card)
        self.selectionStyle = .none
        card.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.left.right.equalToSuperview()
        }
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

