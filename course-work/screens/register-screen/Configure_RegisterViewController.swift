
import UIKit
extension RegisterViewController{
    
    func configure(){
        emailField.translatesAutoresizingMaskIntoConstraints = false
        emailField.backgroundColor = kCardColor
        emailField.layer.cornerRadius = 25
        
        nameField.translatesAutoresizingMaskIntoConstraints = false
        nameField.backgroundColor = kCardColor
        nameField.layer.cornerRadius = 25
        
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.backgroundColor = kCardColor
        passwordField.layer.cornerRadius = 25
        passwordField.isSecureTextEntry = true
        
        registerBtn.setTitle("Sign Up".uppercased(), for: .normal)
        registerBtn.titleColor(for: .normal)
        registerBtn.backgroundColor = kPrimaryColor
        registerBtn.isEnabled = true
        registerBtn.layer.cornerRadius = 27.5
        
        leadText.translatesAutoresizingMaskIntoConstraints = false;
        leadText.text = "Hello new user, we are looking forward for you"
        leadText.numberOfLines = 0
        leadText.textColor = kFontColorMuted
        
        animationLayer.translatesAutoresizingMaskIntoConstraints = false
        
        formView.translatesAutoresizingMaskIntoConstraints = false
        formView.isUserInteractionEnabled = true
        
        imageView1.image = UIImage(named: "animationImg")
        imageView1.clipsToBounds = true
       
        imageView2.image = UIImage(named: "animationImg2")
        imageView2.clipsToBounds = true
        
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.text = "Email Address"
        emailLabel.font = .systemFont(ofSize: 14,weight: .semibold)
        emailLabel.textColor = kFontColorActive
                 
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.text = "Password"
        passwordField.font = .systemFont(ofSize: 14,weight: .semibold)
        passwordField.textColor = kFontColorActive
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Name"
        nameLabel.font = .systemFont(ofSize: 14,weight: .semibold)
        nameLabel.textColor = kFontColorActive
        
        hStackView.translatesAutoresizingMaskIntoConstraints = false;
        hStackView.axis = .horizontal
        
    }
    func setConstratints(){
        
    }
    
}
