import UIKit
import SnapKit

class FoodCardView:UIView{
    
    let hStack:UIStackView = {
        let hs = UIStackView()
        hs.axis = .horizontal
        hs.alignment = .center
        hs.translatesAutoresizingMaskIntoConstraints = false
        return hs
    }()
    let nameStack:UIStackView = {
        let hStack = UIStackView()
        hStack.axis = .horizontal
        hStack.translatesAutoresizingMaskIntoConstraints = false
        hStack.distribution = .fill
        
        return hStack
    }()
    
    let vStack:UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let infoRow:UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let foodImage:UIImageView = {
        let iview = UIImageView(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
        iview.translatesAutoresizingMaskIntoConstraints = false
        iview.image = UIImage(named: "category-fast-foods")
        iview.contentMode = .scaleAspectFit
        return iview
    }()
   
    let foodName:UILabel = {
        let lbl = UILabel()
        lbl.text = "Test"
        lbl.textColor = kFontColorActive
        return lbl
    }()
    let foodDescription:UITextView = {
        let desc  = UITextView()
        desc.textColor = kFontColorHeading
        desc.backgroundColor = .clear
        desc.text = "Lorem Ipsum Site amente sit de"
        desc.isScrollEnabled = false
        desc.translatesAutoresizingMaskIntoConstraints  = false
        desc.textContainer.lineBreakMode = .byTruncatingTail
        desc.textContainer.size = desc.bounds.size
        desc.textContainer.lineFragmentPadding = 0
        desc.font = .systemFont(ofSize: 14)
        return desc
    }()
    let timeInfo:InfoTag = {
        let tag = InfoTag()
        tag.translatesAutoresizingMaskIntoConstraints = false
        return tag
    }()
    
    let calInfo:InfoTag = {
        let tag = InfoTag()
        tag.translatesAutoresizingMaskIntoConstraints = false
        return tag
    }()
    let bookmaMakrBtn:UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "bookmark"), for: .normal)
        btn.tintColor = kPrimaryColor
        return btn
    }()
 
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = kCardColor
        self.layer.cornerRadius = 15
        
        self.addSubview(hStack)
        hStack.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(10)
            make.right.bottom.equalToSuperview().offset(-10)
        }
        
        
        hStack.addArrangedSubview(foodImage)
        foodImage.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.3)
        }
        hStack.addArrangedSubview(Spacer(width: 10))
        hStack.addArrangedSubview(vStack)
        
        vStack.addArrangedSubview(nameStack)
        nameStack.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.3)
        }
        nameStack.addArrangedSubview(foodName)
        hStack.addArrangedSubview(Spacer(width: 10))
        hStack.addArrangedSubview(bookmaMakrBtn)
        bookmaMakrBtn.snp.makeConstraints { make in
            make.width.equalTo(32)
        }
        
        
        vStack.addArrangedSubview(foodDescription)
        foodDescription.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.4)
        }
        vStack.addArrangedSubview(infoRow)
        infoRow.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.3)
        }
        
        timeInfo.icon.image = UIImage(systemName: "clock")
        timeInfo.text.text = "20 Min"
        infoRow.addArrangedSubview(timeInfo)
        timeInfo.snp.makeConstraints { make in
        }
        
        infoRow.addArrangedSubview(Spacer(width: 5))
        
        calInfo.icon.image = UIImage(systemName: "bolt.shield")
        calInfo.text.text = "200.45 cal"
        infoRow.addArrangedSubview(calInfo)
        
        
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
}
