import UIKit
class Row:UIStackView{
    
    var mainAxisAllignment:Bool?
    var crossAxisAllignment:Bool?
    var children:[UI]?
    
    init(mainAxisAllignment: Bool, crossAxisAllignment: Bool, children: Bool, frame:CGRect) {
        super.init(frame: frame)
        self.mainAxisAllignment = mainAxisAllignment
        self.crossAxisAllignment = crossAxisAllignment
        self.children = children
        
        self.alignment = .center
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
