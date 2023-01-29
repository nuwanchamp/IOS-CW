import UIKit
import SnapKit

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
 
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = kCardColor
        self.layer.cornerRadius = 15
     
        // Configure Components
        configure()
        
        // Set components constraints
        setConstraints()
        
        bookmaMakrBtn.addTarget(self, action: #selector(toggleBookmark), for: .touchUpInside)
        
    }
    @objc func toggleBookmark(){
        self.nav?.pushViewController(BookmarkViewController(), animated: true)
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
        foodImage.image = UIImage(named: "category-fast-foods")
        foodImage.contentMode = .scaleAspectFit
        
        foodName.text = "Test"
        foodName.textColor = kFontColorActive
        
        foodDescription.textColor = kFontColorHeading
        foodDescription.backgroundColor = .clear
        foodDescription.text = "Lorem Ipsum Site amente sit de"
        foodDescription.isScrollEnabled = false
        foodDescription.translatesAutoresizingMaskIntoConstraints  = false
        foodDescription.textContainer.lineBreakMode = .byTruncatingTail
        foodDescription.textContainer.size = foodDescription.bounds.size
        foodDescription.textContainer.lineFragmentPadding = 0
        foodDescription.font = .systemFont(ofSize: 14)
        
        timeInfo.translatesAutoresizingMaskIntoConstraints = false
        timeInfo.icon.image = UIImage(systemName: "clock")
        timeInfo.text.text = "20 Min"
               
        calInfo.icon.image = UIImage(systemName: "bolt.shield")
        calInfo.text.text = "200.45 cal"
        calInfo.translatesAutoresizingMaskIntoConstraints = false
        
        bookmaMakrBtn.setImage(UIImage(systemName: "bookmark"), for: .normal)
        bookmaMakrBtn.tintColor = kPrimaryColor
          
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
            hStack.addArrangedSubview(bookmaMakrBtn)
        
        hStack.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(10)
            make.right.bottom.equalToSuperview().offset(-10)
        }

        foodImage.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.3)
        }
        
        vStack.snp.makeConstraints { make in
            make.height.equalToSuperview()
        }
        
        nameStack.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.3)
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
