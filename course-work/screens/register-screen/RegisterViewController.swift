//
//  ViewController.swift
//  course-work
//
//  Created by user229897 on 12/18/22.
//

import UIKit
import SnapKit
import Combine

class RegisterViewController: UIViewController {
    
    var isChecked = false
    private var viewModel = LoginViewModel()
    private var subscription = Set<AnyCancellable>()
    
    let emailField: UITextField = UITextField()
    
    let nameField: UITextField = UITextField()
    
    let passwordField: UITextField = UITextField()
    
    let registerBtn: UIButton = UIButton()
    
    let leadText:UILabel = UILabel()
    
    let animationLayer: UIView = UIView()
    
    let formView : UIView = UIView()
    let imageView1 = UIImageView(frame: CGRect(x: 0, y: 0, width:900, height: 100))
   
    
    let imageView2 = UIImageView(frame: CGRect(x: 0, y: 0, width:900, height: 100))
    let emailLabel : UILabel = UILabel()
    let passwordLabel : UILabel = UILabel()
    let nameLabel : UILabel = UILabel()
    let hStackView : UIStackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        addGradientBg(self: self)
        
        self.title = "Register"
        let apperance = UINavigationBarAppearance()
        apperance.largeTitleTextAttributes = [.foregroundColor: kFontColorHeading]
        navigationItem.standardAppearance = apperance
        self.navigationController?.navigationBar.prefersLargeTitles = true
       
        // Configure Components
        configure()
        // Set Constraints
        setConstraints()
        
        addAnimation()
        eventHandler()
 
    }
    
    
    
    func addAnimation(){
                
        UIView.animate(withDuration: 5.0, delay: 0,options: [.repeat], animations: {
            self.imageView1.frame.origin.x = -440

        }, completion: nil)
        
        UIView.animate(withDuration: 8.0, delay: 1,options: [.repeat], animations: {
            self.imageView2.frame.origin.x = -300
        }, completion: nil)
    }
    
    func eventHandler(){
        
      
        nameField.addTarget(self, action: #selector(nameFieldChange(_:)), for: .editingChanged)
               
        emailField.addTarget(self, action: #selector(emailFieldChange(_:)), for: .editingChanged)
        
        passwordField.addTarget(self, action: #selector(passwordFieldChange(_:)), for: .editingChanged)
        
        registerBtn.addTarget(self, action: #selector(register), for: .touchUpInside)
               
        
    }
   
    @objc func register(){
        print("working")
        viewModel.register()
        self.navigationController?.setViewControllers([LoginViewController()], animated: true)
    }
    
    @objc func emailFieldChange(_ emailfield:UITextField){
        viewModel.email = emailfield.text ?? ""
    }
    @objc func passwordFieldChange(_ passwordField:UITextField){
        viewModel.password = passwordField.text ?? ""
    }
    @objc func nameFieldChange(_ nameField:UITextField){
        viewModel.name = nameField.text ?? ""
    }}

