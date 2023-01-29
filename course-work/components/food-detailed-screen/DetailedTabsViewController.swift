
import UIKit

class DetailedTabsViewController: UIPageViewController {
    
   var pages = [UIViewController]()
    let descriptionPage = DescriptionSubviewController()
    let instructionPage = InstructionsSubviewController()
    let nutritionsPage = NutritionsSubviewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                     
        pages.append(descriptionPage)
        pages.append(instructionPage)
        pages.append(nutritionsPage)
        
        setViewControllers([pages[0]], direction: .forward, animated: true)
           
    }
}

class DescriptionSubviewController:UIViewController{
    let desc:UITextView = UITextView()
    override func viewDidLoad() {
        super.viewDidLoad()
        desc.textColor = kFontColorHeading
        desc.backgroundColor = .clear
        desc.isScrollEnabled = false
        desc.translatesAutoresizingMaskIntoConstraints  = false
        desc.textContainer.lineBreakMode = .byTruncatingTail
        desc.textContainer.size = desc.bounds.size
        desc.textContainer.lineFragmentPadding = 0
        desc.font = .systemFont(ofSize: 14)
        
        view.addSubview(desc)
        desc.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        desc.text = "Lorem Ipsum"
    }
        
}
class InstructionsSubviewController:UIViewController{
    let instructs:UITextView = UITextView()
    override func viewDidLoad() {
        super.viewDidLoad()
        instructs.textColor = kFontColorHeading
        instructs.backgroundColor = .clear
        instructs.isScrollEnabled = false
        instructs.translatesAutoresizingMaskIntoConstraints  = false
        instructs.textContainer.lineBreakMode = .byTruncatingTail
        instructs.textContainer.size = instructs.bounds.size
        instructs.textContainer.lineFragmentPadding = 0
        instructs.font = .systemFont(ofSize: 14)
        
        view.addSubview(instructs)
        instructs.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
    }
        
}

class NutritionsSubviewController:UIViewController{
    let nutritions:UITextView = UITextView()
    override func viewDidLoad() {
        super.viewDidLoad()
        nutritions.textColor = kFontColorHeading
        nutritions.backgroundColor = .clear
        nutritions.isScrollEnabled = false
        nutritions.translatesAutoresizingMaskIntoConstraints  = false
        nutritions.textContainer.lineBreakMode = .byTruncatingTail
        nutritions.textContainer.size = nutritions.bounds.size
        nutritions.textContainer.lineFragmentPadding = 0
        nutritions.font = .systemFont(ofSize: 14)
        
        view.addSubview(nutritions)
        nutritions.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
       
    }
        
}


