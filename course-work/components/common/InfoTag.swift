import UIKit
import SnapKit


class InfoTag:UIStackView{
    
    let icon:UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = kPrimaryColor
        return view
    }()
    
    var text:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = kFontColorMuted
        lbl.font = .systemFont(ofSize: 12)
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addArrangedSubview(icon)
        icon.snp.makeConstraints { make in
            make.width.equalTo(16)
        }
        self.addArrangedSubview(Spacer(width: 10))
        self.addArrangedSubview(text)
       
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
