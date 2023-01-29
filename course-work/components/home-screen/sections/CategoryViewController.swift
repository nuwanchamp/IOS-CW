
import UIKit
import SnapKit
import Combine

protocol CategoryTabDelegate:AnyObject{
    func categoryChanged(id:Int)
}

class CategoryViewController: UIViewController {
  
    var categories:[Cuisine] = [Cuisine]() // Cuisine List
    let homeModel = HomeViewModel()
    var subscriptions:[AnyCancellable] = [AnyCancellable]()
    var currentTab:Int = 0;
    weak var delegate:CategoryTabDelegate?
    
    let categoryCollectionView:UICollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: {
            let lo = UICollectionViewFlowLayout.init()
            lo.scrollDirection = .horizontal
            return lo
        }()
    )
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Configure Components
        configure()
        // set Constratints to components
        setConstraints()
        // Load data
        loadData()
        
    }
    
    func loadData(){
        homeModel.getCuisines()
        homeModel.$cuisineList
            .receive(on: DispatchQueue.main)
            .sink { cuisine in
            
                DispatchQueue.main.async {
                    self.categories = cuisine
                    self.categoryCollectionView.reloadData()
                    
                }
        }.store(in: &subscriptions)
        
    }
       
    
}

extension CategoryViewController:UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return self.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CategoryTag = collectionView.dequeueReusableCell(withReuseIdentifier: "tag", for: indexPath) as! CategoryTag
        cell.categoryName.text = categories[indexPath.row].name
        if(categories[indexPath.row].id == currentTab){
            cell.wrapper.backgroundColor = kPrimaryColor
        }else{
            cell.wrapper.backgroundColor = kCardColor
        }
        
        
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentTab = categories[indexPath.row].id
        categoryCollectionView.reloadData()
        self.delegate?.categoryChanged(id: categories[indexPath.row].id)
    }
    
    
}
extension CategoryViewController{
    func configure(){
            
        categoryCollectionView.translatesAutoresizingMaskIntoConstraints = false;
        categoryCollectionView.showsHorizontalScrollIndicator = false
        categoryCollectionView.backgroundColor = UIColor.clear
        categoryCollectionView.register(CategoryTag.self, forCellWithReuseIdentifier: "tag")
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
    }
    
    func setConstraints(){
        view.addSubview(categoryCollectionView)
        
        categoryCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(60)
        }
        
    }
    
}

class CategoryTag:UICollectionViewCell{
    
    let  wrapper:UIView = {
        let view = UIView();
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = kCardColor
        view.layer.cornerRadius = 20
        return view
    }()
    let categoryName:UILabel = {
        let lbl = UILabel();
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(wrapper);
        wrapper.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)
        }
        
        wrapper.addSubview(categoryName)
        categoryName.centerYAnchor.constraint(equalTo: wrapper.centerYAnchor).isActive = true
        categoryName.centerXAnchor.constraint(equalTo: wrapper.centerXAnchor).isActive = true
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
