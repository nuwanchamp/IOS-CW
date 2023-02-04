

import UIKit
import SnapKit
import Combine

class LoginViewController: UIViewController {
    
    
    private var viewModel = LoginViewModel() 
    private var subscription = Set<AnyCancellable>()
    
    var isChecked = false
    
    // Components
    
    let rememberMeCheckButton: UIButton = UIButton.init(type: .custom )
    let logInBtn: UIButton = UIButton()
    let leadText:UILabel = UILabel()
    
    let animationLayer: UIView = UIView()
        let imageView1 = UIImageView(frame: CGRect(x: 0, y: 0, width:900, height: 100))
        let imageView2 = UIImageView(frame: CGRect(x: 0, y: 0, width:900, height: 100))
    
    let formView : UIView = UIView()
        let emailLabel : UILabel = UILabel()
        let passwordLabel : UILabel = UILabel()
        let emailField: UITextField = UITextField()
        let passwordField: UITextField = UITextField()
        let remeberMeLabel : UILabel = UILabel()
        let hStackView : UIStackView = UIStackView()
        let hLine: UIView = UIView()
        let preSignupLabel: UILabel = UILabel()
        let signupLabel: UILabel = UILabel()
        let labelHStackView : UIStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGradientBg(self: self)
        
        self.title = "Login"
        let apperance = UINavigationBarAppearance()
        apperance.largeTitleTextAttributes = [.foregroundColor: kFontColorHeading]
        navigationItem.standardAppearance = apperance
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        
        // Configure Components
        configure()
        // Set Components constratins
        setConstratints()
        // Handle events
        eventBinding()
        
    }
    

    
    func eventBinding(){
               
        emailField.addTarget(self, action: #selector(emailChange(_:)), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(passwordChange(_:)), for: .editingChanged)
        viewModel.$title.map{$0}.assign(to: \.text, on:remeberMeLabel).store(in: &subscription)
        rememberMeCheckButton.addTarget(self, action: #selector(chooseToPreseistCredentials), for: .touchUpInside)
        logInBtn.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        let touchGesture = UITapGestureRecognizer(target: self, action: #selector(signUp))
        signupLabel.addGestureRecognizer(touchGesture)
     
    }
    
    @objc func chooseToPreseistCredentials(){
        isChecked.toggle()
        rememberMeCheckButton.isSelected = isChecked
        viewModel.title = isChecked ? "Don't Remember me" : "Remember Me"
    }
    
    @objc func signIn(){
        viewModel.signIn { resp in
            if(resp){
                 self.navigationController?.setViewControllers([HomeViewController()], animated: true)
            }else{
                var alert = createAlert(title: "Error", message: "Invalid user details") { UIAlertAction in
                    // Do nothing
                }
                self.present(alert, animated: true, completion: nil)
            }
        }
       
    }
    
    @objc func signUp(){
        self.navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
    
    @objc func emailChange(_ emailfield:UITextField){
        viewModel.email = emailfield.text ?? ""
    }
    
    @objc func passwordChange(_ passwordField:UITextField){
        viewModel.password = passwordField.text ?? ""
    }
}

    
