
import UIKit
import SnapKit

class CategoryViewController: UIViewController {
  
    let categories:[String] = ["Breakfast", "Brunch", "Lunch", "Dinner", "Fast Foods", "10 Mins"]
    
    let categoryCollectionView:UICollectionView = {
       
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        let cv =  UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false;
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = UIColor.clear
        return cv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .systemCyan
        view.addSubview(categoryCollectionView)
        
        categoryCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(60)
        }
      
        categoryCollectionView.register(CategoryTag.self, forCellWithReuseIdentifier: "tag")
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self

        
    }
       
    
}

extension CategoryViewController:UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return self.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CategoryTag = collectionView.dequeueReusableCell(withReuseIdentifier: "tag", for: indexPath) as! CategoryTag
        cell.categoryName.text = categories[indexPath.row]
        if(indexPath.row == 0){
            cell.wrapper.backgroundColor = kPrimaryColor
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 50)
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
