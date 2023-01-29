
import UIKit

extension RegisterViewController{
    
    func setConstraints(){
        print("working")
        self.view.addSubview(leadText)
        self.view.addSubview(animationLayer)
            animationLayer.addSubview(imageView1)
            animationLayer.addSubview(imageView2)
            animationLayer.bringSubviewToFront(imageView1)
        self.view.addSubview(formView)
            formView.addSubview(nameLabel)
            formView.addSubview(nameField)
            formView.addSubview(emailLabel)
            formView.addSubview(emailField)
            formView.addSubview(passwordLabel)
            formView.addSubview(passwordField)
            formView.addSubview(hStackView)
            formView.addSubview(registerBtn)
        
        leadText.snp.makeConstraints{make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        animationLayer.snp.makeConstraints{ make in
            make.top.equalTo(leadText.snp.bottom).offset(50)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
                
        formView.snp.makeConstraints{ make in
            make.top.equalTo(animationLayer.snp.bottom).offset(50)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(500)
        }
        
        
        nameLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(30)
        }
        

        nameField.snp.makeConstraints{
            make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
        
        emailLabel.snp.makeConstraints{ make in
            make.top.equalTo(nameField.snp.bottom)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(30)
        }
        
        
        emailField.snp.makeConstraints{
            make in
            make.top.equalTo(emailLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
        
        
        passwordLabel.snp.makeConstraints{make in
            make.top.equalTo(emailField.snp.bottom)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(30)
            
        }
        
        passwordField.snp.makeConstraints{
            make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
        
        view.addSubview(hStackView)
        hStackView.snp.makeConstraints{make in
            make.top.equalTo(passwordField.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }

        registerBtn.snp.makeConstraints{ make in
            make.top.equalTo(hStackView.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(55)
            
        }
        
    }
}
