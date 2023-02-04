

import UIKit

extension LoginViewController{
    
    func configure(){
        
        
        let checkedImage = UIImage(systemName: "checkmark.square")?.withTintColor(kPrimaryColor, renderingMode: .alwaysOriginal)
        let uncheckedImage = UIImage(systemName: "square")?.withTintColor(kFontColorMuted, renderingMode: .alwaysOriginal)
        rememberMeCheckButton.setImage(checkedImage, for: .selected)
        rememberMeCheckButton.setImage(uncheckedImage, for: .normal)
        rememberMeCheckButton.backgroundColor = kCardColor
        rememberMeCheckButton.layer.cornerRadius = 5
        
        
        logInBtn.setTitle("Sign In".uppercased(), for: .normal)
        logInBtn.titleColor(for: .normal)
        logInBtn.backgroundColor = kPrimaryColor
        logInBtn.isEnabled = true
        logInBtn.layer.cornerRadius = 27.5
        
        leadText.translatesAutoresizingMaskIntoConstraints = false;
        leadText.text = "Please login to your account to continue \nwith meal mate"
        leadText.numberOfLines = 0
        leadText.textColor = kFontColorMuted
        

        animationLayer.translatesAutoresizingMaskIntoConstraints = false
        
            imageView1.image = UIImage(named: "animationImg")
            imageView1.clipsToBounds = true
        
            imageView2.image = UIImage(named: "animationImg2")
            imageView2.clipsToBounds = true
        
        formView.translatesAutoresizingMaskIntoConstraints = false
        formView.isUserInteractionEnabled = true
        
            emailLabel.translatesAutoresizingMaskIntoConstraints = false
            emailLabel.text = "Email Address"
            emailLabel.font = .systemFont(ofSize: 14,weight: .semibold)
            emailLabel.textColor = kFontColorActive
             
        
            passwordLabel.translatesAutoresizingMaskIntoConstraints = false
            passwordLabel.text = "Password"
            passwordLabel.font = .systemFont(ofSize: 14,weight: .semibold)
            passwordLabel.textColor = kFontColorActive
               
        
            emailField.translatesAutoresizingMaskIntoConstraints = false
            emailField.backgroundColor = kCardColor
            emailField.layer.cornerRadius = 25
            emailField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height:emailField.frame.height))
            emailField.leftViewMode = .always
            emailField.textColor = .white
       
            passwordField.translatesAutoresizingMaskIntoConstraints = false
            passwordField.backgroundColor = kCardColor
            passwordField.layer.cornerRadius = 25
            passwordField.isSecureTextEntry = true
            passwordField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height:passwordField.frame.height))
            passwordField.leftViewMode = .always
            passwordField.textColor = .white
        
            remeberMeLabel.translatesAutoresizingMaskIntoConstraints = false
            remeberMeLabel.font = .systemFont(ofSize: 14,weight: .semibold)
            remeberMeLabel.textColor = kFontColorMuted
           
        
            hStackView.translatesAutoresizingMaskIntoConstraints = false;
            hStackView.axis = .horizontal
          
        
            hLine.backgroundColor = UIColor("#37202F")
            hLine.translatesAutoresizingMaskIntoConstraints = false
        
       
            preSignupLabel.text = "Don't have an Account? Please "
            preSignupLabel.translatesAutoresizingMaskIntoConstraints = false
            preSignupLabel.font = .systemFont(ofSize: 14)
            preSignupLabel.textAlignment = .right
            preSignupLabel.textColor = kFontColorActive
          
       
            signupLabel.text = " Sign Up"
            signupLabel.translatesAutoresizingMaskIntoConstraints = false
            signupLabel.textAlignment = .left
            signupLabel.font = .systemFont(ofSize: 14)
            signupLabel.textColor = kPrimaryColor
            signupLabel.isUserInteractionEnabled = true
        
       
            labelHStackView.translatesAutoresizingMaskIntoConstraints = false
            labelHStackView.axis = .horizontal
            labelHStackView.alignment = .center
           
    }}
