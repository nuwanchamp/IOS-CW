//
//  ViewController.swift
//  course-work
//
//  Created by user229897 on 12/18/22.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    var isChecked = false
    let rememberMeCheckButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "unchecked"), for: .normal)
        btn.setImage(UIImage(named: "checked"), for: .selected)
        btn.backgroundColor = kCardColor
        btn.layer.cornerRadius = 5
        return btn
       }()
    
    let logInBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Sign In".uppercased(), for: .normal)
        btn.titleColor(for: .normal)
        btn.backgroundColor = kPrimaryColor
        btn.isEnabled = true
        btn.layer.cornerRadius = 27.5
        return btn
        
    }()
    
    let leadText:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false;
        lbl.text = "Please login to your account to continue \nwith meal mate"
        lbl.numberOfLines = 0
        lbl.textColor = kFontColorMuted
        return lbl
        
    }()
    
    let animationLayer: UIView = {
        let aLayer = UIView()
        aLayer.translatesAutoresizingMaskIntoConstraints = false
        return aLayer
        
    }()
    
    let formView : UIView = {
        let formLayer = UIView()
        formLayer.translatesAutoresizingMaskIntoConstraints = false
        //formLayer.backgroundColor = .systemTeal
        formLayer.isUserInteractionEnabled = true
        return formLayer
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addGradientBg(self: self)
        
        self.title = "Login"
        let apperance = UINavigationBarAppearance()
        apperance.largeTitleTextAttributes = [.foregroundColor: kFontColorHeading]
        navigationItem.standardAppearance = apperance
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.view.addSubview(leadText)
        
        leadText.snp.makeConstraints{make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        self.view.addSubview(animationLayer)
        animationLayer.snp.makeConstraints{ make in
            make.top.equalTo(leadText.snp.bottom).offset(50)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        addAnimation(view:animationLayer)
        
        self.view.addSubview(formView)
        formView.snp.makeConstraints{ make in
            make.top.equalTo(animationLayer.snp.bottom).offset(50)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(500)
        }
        addFormContent(view:formView)
        
        
        
        
    }
    
    
    
    func addAnimation(view: UIView){
        _ = view.bounds.size.width
        
        let imageView1 = UIImageView(frame: CGRect(x: 0, y: 0, width:900, height: 100))
        imageView1.image = UIImage(named: "animationImg")
        imageView1.clipsToBounds = true
        view.addSubview(imageView1)
        
        let imageView2 = UIImageView(frame: CGRect(x: 0, y: 0, width:900, height: 100))
        imageView2.image = UIImage(named: "animationImg2")
        imageView2.clipsToBounds = true
        view.addSubview(imageView2)
        
        view.bringSubviewToFront(imageView1)
        
        
        UIView.animate(withDuration: 5.0, delay: 0,options: [.repeat], animations: {
            imageView1.frame.origin.x = -440
            //imageView1.frame.origin.x = 150
        }, completion: nil)
        
        UIView.animate(withDuration: 8.0, delay: 1,options: [.repeat], animations: {
            imageView2.frame.origin.x = -300
            //imageView1.frame.origin.x = 150
        }, completion: nil)
    }
    
    func addFormContent(view: UIView){
        
        //view.bounds = view.frame.insetBy(dx: 20, dy: 0)
        
        let emailLabel : UILabel = {
            let lbl = UILabel()
            lbl.translatesAutoresizingMaskIntoConstraints = false
            lbl.text = "Email Address"
            lbl.font = .systemFont(ofSize: 14,weight: .semibold)
            lbl.textColor = kFontColorActive
            return lbl
        }()
        
        let passwordLabel : UILabel = {
            let lbl = UILabel()
            lbl.translatesAutoresizingMaskIntoConstraints = false
            lbl.text = "Password"
            lbl.font = .systemFont(ofSize: 14,weight: .semibold)
            lbl.textColor = kFontColorActive
            return lbl
        }()
        
        let emailField: UITextField = {
            let textField = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.backgroundColor = kCardColor
            textField.layer.cornerRadius = 25
            return textField
        }()
        let passwordField: UITextField = {
            let textField = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.backgroundColor = kCardColor
            textField.layer.cornerRadius = 25
            textField.isSecureTextEntry = true
            return textField
        }()
        
        view.addSubview(emailLabel)
        emailLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(30)
        }
        
        view.addSubview(emailField)
        emailField.snp.makeConstraints{
            make in
            make.top.equalTo(emailLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
        
        view.addSubview(passwordLabel)
        passwordLabel.snp.makeConstraints{make in
            make.top.equalTo(emailField.snp.bottom)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(30)
            
        }
        
        view.addSubview(passwordField)
        passwordField.snp.makeConstraints{
            make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
        
        let remeberMeLabel : UILabel = {
            let lbl = UILabel()
            lbl.translatesAutoresizingMaskIntoConstraints = false
            lbl.text = "Remember Me"
            lbl.font = .systemFont(ofSize: 14,weight: .semibold)
            lbl.textColor = kFontColorMuted
            return lbl
        }()
        
        let hStackView : UIStackView = {
            let view = UIStackView()
            view.translatesAutoresizingMaskIntoConstraints = false;
            view.axis = .horizontal
            return view
        }()
        view.addSubview(hStackView)
        hStackView.snp.makeConstraints{make in
            make.top.equalTo(passwordField.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        rememberMeCheckButton.addTarget(self, action: #selector(chooseToPreseistCredentials), for: .touchUpInside)
        
        hStackView.addSubview(rememberMeCheckButton)
        rememberMeCheckButton.snp.makeConstraints{
            make in
            make.width.equalTo(18)
            make.height.equalTo(18)
            make.left.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        hStackView.addSubview(remeberMeLabel)
        remeberMeLabel.snp.makeConstraints{
            make in
            make.left.equalTo(rememberMeCheckButton.snp.right).offset(10)
            make.top.equalToSuperview()
            make.height.equalTo(18)
            
        }
        view.addSubview(logInBtn)
        logInBtn.snp.makeConstraints{ make in
            make.top.equalTo(hStackView.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(55)
            
        }
        logInBtn.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        
        let hLine: UIView = {
            let line = UIView()
            line.backgroundColor = UIColor("#37202F")
            line.translatesAutoresizingMaskIntoConstraints = false
            return line
        }()
        view.addSubview(hLine)
        
        hLine.snp.makeConstraints{
            make in
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
            make.top.equalTo(logInBtn.snp.bottom).offset(40)
            make.height.equalTo(2)
        }
        
        let preSignupLabel: UILabel = {
            let lbl = UILabel()
            lbl.text = "Don't have an Account? Please "
            lbl.translatesAutoresizingMaskIntoConstraints = false
            lbl.font = .systemFont(ofSize: 14)
            lbl.textAlignment = .right
            lbl.textColor = kFontColorActive
            return lbl
        }()
        let signupLabel: UILabel = {
            let lbl = UILabel()
            lbl.text = " Sign Up"
            lbl.translatesAutoresizingMaskIntoConstraints = false
            lbl.textAlignment = .left
            lbl.font = .systemFont(ofSize: 14)
            lbl.textColor = kPrimaryColor
            return lbl
        }()
        
        let labelHStackView : UIStackView = {
            let hstack = UIStackView()
            hstack.translatesAutoresizingMaskIntoConstraints = false
            hstack.axis = .horizontal
            hstack.alignment = .center
            return hstack
        }()
        
        labelHStackView.addArrangedSubview(preSignupLabel)
       preSignupLabel.snp.makeConstraints{
           make in
            make.top.equalToSuperview()
           make.width.equalToSuperview().multipliedBy(0.7)
           
        }
        labelHStackView.addArrangedSubview(signupLabel)
        signupLabel.snp.makeConstraints{
            make in
            make.top.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.3)
        }
        view.addSubview(labelHStackView)
        labelHStackView.snp.makeConstraints{make in
            make.top.equalTo(hLine.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        
        
        
        
    }
    @objc func chooseToPreseistCredentials(){
        isChecked.toggle()
        rememberMeCheckButton.isSelected = isChecked
    }
    @objc func signIn(){
        print("working")
        self.navigationController?.setViewControllers([HomeViewController()], animated: true)
    }
}

    
