//
//  HeaderViewController.swift
//  course-work
//
//  Created by user229897 on 1/5/23.
//

import UIKit

class HeaderViewController: UIViewController {

    let hStack:UIStackView = UIStackView()
    let foodImage:UIImageView = UIImageView()
    let dpFrame:UIView = UIView()
    let detailView:UIStackView = UIStackView()
    var name:UILabel = UILabel()
    let foodShortDescription:UITextView = UITextView()
    let time = InfoTag()
    let cal = InfoTag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // CONFIGURE COMPONENETS
        configure()
        // SET CONSTRATINTS
        setConstratints()
        
    }
    
    
}

extension HeaderViewController{
    func configure(){
        hStack.axis = .horizontal
        hStack.translatesAutoresizingMaskIntoConstraints = false
        
        foodImage.contentMode = .scaleAspectFill
        foodImage.translatesAutoresizingMaskIntoConstraints = false
        
        dpFrame.backgroundColor = kFontColorHeading
        dpFrame.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        dpFrame.translatesAutoresizingMaskIntoConstraints = false
        dpFrame.clipsToBounds = true
        dpFrame.layer.cornerRadius = 75
        dpFrame.layer.borderWidth = 4
        dpFrame.layer.borderColor = kPrimaryColor.cgColor

        detailView.axis = .vertical
        detailView.translatesAutoresizingMaskIntoConstraints = false
        
        name.font = .systemFont(ofSize: 20)
        name.lineBreakMode = .byWordWrapping
        name.numberOfLines = 2
        name.textColor = kFontColorActive
        
        foodShortDescription.textColor = kFontColorHeading
        foodShortDescription.backgroundColor = .clear
        foodShortDescription.isScrollEnabled = false
        foodShortDescription.translatesAutoresizingMaskIntoConstraints  = false
        foodShortDescription.textContainer.lineBreakMode = .byTruncatingTail
        foodShortDescription.textContainer.size = foodShortDescription.bounds.size
        foodShortDescription.textContainer.lineFragmentPadding = 0
        foodShortDescription.font = .systemFont(ofSize: 14)
        
        time.icon.image = UIImage(systemName: "clock")
        cal.icon.image = UIImage(systemName: "bolt.shield")
    }
    func setConstratints(){
        view.addSubview(hStack)
            hStack.addSubview(dpFrame)
                dpFrame.addSubview(foodImage)
            hStack.addSubview(detailView)
                detailView.addSubview(name)
                detailView.addSubview(foodShortDescription)
                detailView.addSubview(time)
                detailView.addSubview(cal)
        
        hStack.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(20)
            make.right.bottom.equalToSuperview().offset(-20)
        }
        
       
        dpFrame.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(150)
        }
        
        
        foodImage.snp.makeConstraints { make in
            make.top.left.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        
        detailView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalTo(dpFrame.snp.right).offset(15)
            make.right.bottom.equalToSuperview()
    
        }
        
        name.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(20)
        }
        
        foodShortDescription.snp.makeConstraints { make in
            make.left.equalTo(dpFrame.snp.right).offset(15)
            make.right.equalToSuperview()
            make.top.equalTo(name.snp.bottom)
            make.height.equalTo(70)
        }
        
        
        
        time.snp.makeConstraints { make in
            make.top.equalTo(foodShortDescription.snp.bottom)
            make.left.equalTo(dpFrame.snp.right).offset(15)
            make.height.equalTo(20)
        }
        
        
        
        cal.snp.makeConstraints { make in
            make.left.equalTo(time.snp.right).offset(10)
            make.top.equalTo(foodShortDescription.snp.bottom)
            make.height.equalTo(20)
        }
        
    }
}
