

import UIKit

extension LoginViewController{
    
    func setConstratints(){
        
        self.view.addSubview(leadText)
        self.view.addSubview(animationLayer)
            animationLayer.addSubview(imageView1)
            animationLayer.addSubview(imageView2)
            animationLayer.bringSubviewToFront(imageView1)
            addAnimation()
        
        self.view.addSubview(formView)
            formView.addSubview(emailLabel)
            formView.addSubview(emailField)
            formView.addSubview(passwordLabel)
            formView.addSubview(passwordField)
            formView.addSubview(hStackView)
                hStackView.addSubview(rememberMeCheckButton)
                hStackView.addSubview(remeberMeLabel)
            formView.addSubview(logInBtn)
            formView.addSubview(hLine)
            formView.addSubview(labelHStackView)
                labelHStackView.addArrangedSubview(preSignupLabel)
                labelHStackView.addArrangedSubview(signupLabel)
        
       
        
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
        emailLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview()
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
        hStackView.snp.makeConstraints{make in
            make.top.equalTo(passwordField.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(20)
        }
        rememberMeCheckButton.snp.makeConstraints{
            make in
            make.width.equalTo(18)
            make.height.equalTo(18)
            make.left.equalToSuperview()
            make.top.equalToSuperview()
        }
        remeberMeLabel.snp.makeConstraints{
            make in
            make.left.equalTo(rememberMeCheckButton.snp.right).offset(10)
            make.top.equalToSuperview()
            make.height.equalTo(18)
            
        }
        logInBtn.snp.makeConstraints{ make in
            make.top.equalTo(hStackView.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(55)
            
        }
        hLine.snp.makeConstraints{
            make in
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
            make.top.equalTo(logInBtn.snp.bottom).offset(40)
            make.height.equalTo(2)
        }
        preSignupLabel.snp.makeConstraints{
            make in
             make.top.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
            
         }
        signupLabel.snp.makeConstraints{
            make in
            make.top.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.3)
        }
        labelHStackView.snp.makeConstraints{make in
            make.top.equalTo(hLine.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
    }
    
    func addAnimation(){

        UIView.animate(withDuration: 5.0, delay: 0,options: [.repeat], animations: {
            self.imageView1.frame.origin.x = -440
            //imageView1.frame.origin.x = 150
        }, completion: nil)
        
        UIView.animate(withDuration: 8.0, delay: 1,options: [.repeat], animations: {
            self.imageView2.frame.origin.x = -300
            //imageView1.frame.origin.x = 150
        }, completion: nil)
    }
    
}
