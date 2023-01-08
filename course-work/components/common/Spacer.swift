import UIKit

class Spacer:UIView{

    init(width: CGFloat = .zero, height:CGFloat = .zero) {
        super.init(frame: .zero)
        if width != .zero{
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height != .zero{
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
