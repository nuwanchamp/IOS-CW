
import UIKit
import SnapKit
protocol TabHeaderDelegate:AnyObject{
    func DidTabChanged(indexPath:IndexPath)
}

class TabHeadersViewController: UIViewController {
    
    weak var delegate:TabHeaderDelegate?
    let tabs:[String] = ["Description", "Instructions", "Nutritions"]
    let tabList:UICollectionView = {
       
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
        view.addSubview(tabList)
        
        tabList.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(60)
        }
      
        tabList.register(TabHeader.self, forCellWithReuseIdentifier: "tag")
        tabList.dataSource = self
        tabList.delegate = self

        
    }
       
    
}

extension TabHeadersViewController:UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return self.tabs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:TabHeader = collectionView.dequeueReusableCell(withReuseIdentifier: "tag", for: indexPath) as! TabHeader
        cell.categoryName.text = tabs[indexPath.row]
        if(indexPath.row == 0){
            cell.wrapper.backgroundColor = kPrimaryColor
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.DidTabChanged(indexPath: indexPath)
    }
    
    
}

class TabHeader:UICollectionViewCell{
    
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
