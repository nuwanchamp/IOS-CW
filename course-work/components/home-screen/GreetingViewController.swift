//
//  GreetingViewController.swift
//  course-work
//
//  Created by user229897 on 12/30/22.
//

import UIKit

class GreetingViewController: UIViewController {
    
    let name:String = "John Doe";
    let nameLabel:UILabel = {
        let lbl = UILabel()
        lbl.textColor = kFontColorMuted
        return lbl
    }()
    let greetingLayer: UIStackView = {
        let stk = UIStackView()
        stk.axis = .horizontal
        //stk.backgroundColor = .systemRed
        stk.alignment = .top
        return stk
    }()
    
    let nameStack:UIStackView = {
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.alignment = .top
        return vStack
    }()
    
    let greeting:UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 34, weight: .bold)
        lbl.text = "Welcome"
        lbl.textColor = kFontColorHeading
        return lbl
    }()
    
    let dP:UIImageView = {
        let profileDP = UIImageView()
        profileDP.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        profileDP.translatesAutoresizingMaskIntoConstraints = false
        return profileDP
    }()
    let dpFrame:UIView = {
        let frm = UIView()
        frm.backgroundColor = kFontColorHeading
        frm.frame = CGRect(x: 0, y: 0, width: 110, height: 110)
        frm.translatesAutoresizingMaskIntoConstraints = false
        return frm
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // self.view.backgroundColor = .green

        self.view.addSubview(greetingLayer)
        greetingLayer.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100);
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(120)
        }
        greetingLayer.addSubview(nameStack)
        
        nameStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalToSuperview()
        }
        nameStack.addArrangedSubview(greeting)
        nameStack.addArrangedSubview(nameLabel)
        nameLabel.text = name
        
        greetingLayer.addSubview(dpFrame);
        dpFrame.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
        }
        
        dpFrame.addSubview(dP)
        dpFrame.layer.cornerRadius = 30
        dP.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
        }
        
        dP.image = UIImage(named: "profile.png")
        dP.contentMode = .scaleToFill
    }
    


}
