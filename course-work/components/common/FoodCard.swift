import UIKit
import SnapKit
import Combine
import RiveRuntime

protocol FoodCardDelegate:AnyObject{
    func didRemoveBookamrk()
    func beforeAddBookmark()
    func afterAddBookmark()
}

class FoodCardView:UIView{

    var nav:UINavigationController?
    let hStack:UIStackView = UIStackView()
    let nameStack:UIStackView = UIStackView()
    let vStack:UIStackView = UIStackView()
    let infoRow:UIStackView = UIStackView()
    let foodImage:UIImageView = UIImageView()
    let foodName:UILabel = UILabel()
    let foodDescription: UITextView = UITextView()
    let timeInfo:InfoTag = InfoTag()
    let calInfo:InfoTag = InfoTag()
    let bookmaMakrBtn:UIButton = UIButton()
    let removeBookMarkBtn:UIButton = UIButton()
    var recipeId:Int = -1
    let bookmarkModel = BookmarkViewModel()
    var shimmer = false
    
    weak var delegate:FoodCardDelegate?
    var gradientLayer: CAGradientLayer!
    private var subscriptions = Set<AnyCancellable>()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = kCardColor
        self.layer.cornerRadius = 15
        if(shimmer){
                       
        }else{
            
        }
        
     
        // Configure Components
        configure()
        
        // Set components constraints
        setConstraints()
        
        
        bookmaMakrBtn.addTarget(self, action: #selector(toggleBookmark), for: .touchUpInside)
        removeBookMarkBtn.addTarget(self, action: #selector(toggleRemoveBtn), for: .touchUpInside)
        
    }
    @objc func toggleBookmark(){
        
        self.delegate?.beforeAddBookmark()
        // Check recipe Already exists on bookmark list
        if(SessionManager.shared.getBookmarkByRecipeId(id: recipeId) != nil){
            
            return
        }
        bookmarkModel.addBookmark(recipe_id: recipeId).sink { completion in
            switch(completion){
            
            case .finished:
                break
            
            case .failure(let e):
                print("Error \(e)")
            }
        } receiveValue: { response in
            print("res:\(response)")
            SessionManager.shared.bookmarks.append(response.data)
            self.delegate?.afterAddBookmark()
        }.store(in: &subscriptions)
        

    }
    @objc func toggleRemoveBtn(){
        bookmarkModel.rmBookmark(recipe_id: recipeId).sink { completion in
            switch(completion){
                
            case .finished:
                break
            case .failure(let e):
                print(e)
            }
        } receiveValue: { res in
            print(res)
            if res.status == 200{
                // Remove from the session manager
                SessionManager.shared.removeBookmarkFromListByRecipeId(recipe_id:self.recipeId)
                self.delegate?.didRemoveBookamrk()
                
            }
        }.store(in: &subscriptions)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension FoodCardView{
    func configure(){
        hStack.axis = .horizontal
        hStack.alignment = .center
        hStack.translatesAutoresizingMaskIntoConstraints = false
        
        nameStack.axis = .horizontal
        nameStack.translatesAutoresizingMaskIntoConstraints = false        
       
        vStack.axis = .vertical
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.distribution = .equalSpacing
        
        infoRow.axis = .horizontal
        infoRow.translatesAutoresizingMaskIntoConstraints = false
        
        foodImage.translatesAutoresizingMaskIntoConstraints = false
        //foodImage.image = UIImage(named: "category-fast-foods")
        foodImage.contentMode = .scaleAspectFit
        foodImage.layer.cornerRadius = 20
        foodImage.clipsToBounds = true
        
       // foodName.text = "Test"
        foodName.textColor = kFontColorActive
        
        foodDescription.textColor = kFontColorHeading
        foodDescription.backgroundColor = .clear
       // foodDescription.text = "Lorem Ipsum Site amente sit de"
        foodDescription.isScrollEnabled = false
        foodDescription.translatesAutoresizingMaskIntoConstraints  = false
        foodDescription.textContainer.lineBreakMode = .byTruncatingTail
        foodDescription.textContainer.size = foodDescription.bounds.size
        foodDescription.textContainer.lineFragmentPadding = 0
        foodDescription.font = .systemFont(ofSize: 14)
        
        timeInfo.translatesAutoresizingMaskIntoConstraints = false
        timeInfo.icon.image = UIImage(systemName: "clock")
        //timeInfo.text.text = "20 Min"
               
        calInfo.icon.image = UIImage(systemName: "bolt.shield")
        //calInfo.text.text = "200.45 cal"
        calInfo.translatesAutoresizingMaskIntoConstraints = false
        
        bookmaMakrBtn.setImage(UIImage(systemName: "bookmark"), for: .normal)
        bookmaMakrBtn.tintColor = kPrimaryColor
        
        removeBookMarkBtn.setImage(UIImage(systemName: "trash.fill"), for: .normal)
        removeBookMarkBtn.tintColor = kPrimaryColor
        removeBookMarkBtn.isHidden = true
        
    }
    func setConstraints(){
        self.addSubview(hStack)
            hStack.addArrangedSubview(foodImage)
            hStack.addArrangedSubview(Spacer(width: 10))
            hStack.addArrangedSubview(vStack)
                vStack.addArrangedSubview(nameStack)
                    nameStack.addArrangedSubview(foodName)
                vStack.addArrangedSubview(foodDescription)
                vStack.addArrangedSubview(infoRow)
                    infoRow.addArrangedSubview(Spacer(width: 5))
                    infoRow.addArrangedSubview(timeInfo)
                    infoRow.addArrangedSubview(calInfo)
            hStack.addArrangedSubview(Spacer(width: 10))
        // Only logged user can book mark products
        print(UserDefaults.standard.bool(forKey: "isLoggedIn"))
        if(UserDefaults.standard.bool(forKey: "isLoggedIn")){
            
            hStack.addArrangedSubview(removeBookMarkBtn)
            
            hStack.addArrangedSubview(bookmaMakrBtn)
        }
        
        hStack.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(10)
            make.right.bottom.equalToSuperview().offset(-10)
        }

        foodImage.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.28)
        }
        
        vStack.snp.makeConstraints { make in
            make.height.equalToSuperview()
        }
        
        nameStack.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.3)
        }
        
        removeBookMarkBtn.snp.makeConstraints { make in
                make.width.equalTo(32)
        }
            
       
        bookmaMakrBtn.snp.makeConstraints { make in
                make.width.equalTo(32)
        }
       
       
        foodDescription.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.4)
        }
       
        infoRow.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.3)
        }
        
    }
}
