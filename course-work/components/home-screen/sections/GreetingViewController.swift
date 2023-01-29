import UIKit


class GreetingViewController: UIViewController {

    let name:String = UserDefaults.standard.string(forKey: "name") ?? "John Doe";
    let nameLabel:UILabel = UILabel()
    let greetingLayer: UIStackView =  UIStackView()
    let nameStack:UIStackView = UIStackView()
    let greeting:UILabel = UILabel()
    let dP:UIImageView = UIImageView()
    let dpFrame:UIView =  UIView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Configure components
        configure()
        // Set Constratints to components
        setConstraints()
        
        let contextMenuInteraction = UIContextMenuInteraction(delegate: self)
        dP.addInteraction(contextMenuInteraction)
       
    }
   
   
}

extension GreetingViewController:UIContextMenuInteractionDelegate{
    
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        let bookmark = UIAction(title: "Bookmarks", image: UIImage(systemName: "bookmark.square")) { action in
                    // perform bookmark action
                }
                let logout = UIAction(title: "Logout", image: UIImage(systemName: "arrow.uturn.backward.square")) { action in
                    UserDefaults.standard.set(false, forKey: "isLoggedIn")
                }
        
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { suggestedActions in
            return UIMenu(title: "Menu", children: [bookmark, logout])
        }
        
    }
}

extension GreetingViewController{
    
    func configure(){
        
            nameLabel.textColor = kFontColorMuted
            nameLabel.text = name
        
            greetingLayer.axis = .horizontal
            greetingLayer.alignment = .top
        
            nameStack.axis = .vertical
            nameStack.alignment = .top
        
        
            greeting.font = .systemFont(ofSize: 34, weight: .bold)
            greeting.text = "Welcome"
            greeting.textColor = kFontColorHeading
        
       
            dP.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            dP.translatesAutoresizingMaskIntoConstraints = false
            dP.image = UIImage(named: "profile.png")
            dP.contentMode = .scaleToFill
            dP.isUserInteractionEnabled = true
        
            dpFrame.backgroundColor = kFontColorHeading
            dpFrame.frame = CGRect(x: 0, y: 0, width: 110, height: 110)
            dpFrame.translatesAutoresizingMaskIntoConstraints = false
            dpFrame.layer.cornerRadius = 30
        
        
    }
    func setConstraints(){
        self.view.addSubview(greetingLayer)
            greetingLayer.addSubview(nameStack)
                nameStack.addArrangedSubview(greeting)
                nameStack.addArrangedSubview(nameLabel)
            greetingLayer.addSubview(dpFrame)
                dpFrame.addSubview(dP)
       
        
        greetingLayer.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100);
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(120)
        }
              
        nameStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalToSuperview()
        }
      
        dpFrame.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
        }
        
        dP.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
        }
        
    
    }
}

