
import UIKit
import SnapKit
import Kingfisher

class FoodDetailedViewController: UIViewController {

    let header = HeaderViewController()
    let tabs = DetailedTabsViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    let tabHeaders = TabHeadersViewController()
    var recipe:Recipe
    
    init(recipe: Recipe) {
            self.recipe = recipe
            super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGradientBg(self: self)
        
        // =================================================
        // Header Section
        // =================================================
        view.addSubview(header.view);
        header.view.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.height.equalToSuperview().multipliedBy(0.25)
        }
        // =================================================
        // Tabs Header Section
        // =================================================
        view.addSubview(tabHeaders.view)
        tabHeaders.view.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(header.view.snp.bottom)
            make.height.equalTo(60)
        }
        tabHeaders.delegate = self
        // =================================================
        // Tabs Content Section
        // =================================================
        addChild(tabs)
        view.addSubview(tabs.view)
        tabs.view.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(tabHeaders.view.snp.bottom)
            make.height.equalToSuperview().multipliedBy(0.55)
        }
        
        tabs.didMove(toParent: self)
        initiate()
        
    }
}
extension FoodDetailedViewController{
    func initiate(){
        self.header.name.text = self.recipe.name
        self.header.foodShortDescription.text = self.recipe.shortDescription
        self.header.time.text.text = "\(self.recipe.time) Min"
        self.header.cal.text.text = "\(self.recipe.calories) Cal"
        self.header.foodImage.kf.setImage(with: URL(string:self.recipe.image))
        self.tabs.descriptionPage.desc.text = self.recipe.description
        print(self.recipe.instructions)
        self.tabs.instructionPage.instructs.text = self.recipe.instructions
       
        
        self.tabs.nutritionsPage.nutritionSet = self.recipe.nutrition
        
    }
}

extension FoodDetailedViewController:TabHeaderDelegate{
    func DidTabChanged(indexPath: IndexPath) {
        if indexPath.row < tabs.pages.count {
            tabs.setViewControllers([tabs.pages[indexPath.row]], direction: .forward, animated: true)
        }
    }
    
    
}

