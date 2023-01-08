//
//  HeaderViewController.swift
//  course-work
//
//  Created by user229897 on 1/5/23.
//

import UIKit

class HeaderViewController: UIViewController {

    let hStack:UIStackView = {
        let st = UIStackView()
        st.axis = .horizontal
        st.translatesAutoresizingMaskIntoConstraints = false
        
        return st
    }()
    let foodImage:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "category-fast-foods")
        return img
    }()
    let dpFrame:UIView = {
        let frm = UIView()
        frm.backgroundColor = kFontColorHeading
        frm.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        frm.translatesAutoresizingMaskIntoConstraints = false
        return frm
    }()
    
    let detailView:UIStackView = {
        let stk = UIStackView()
        stk.axis = .vertical
        stk.translatesAutoresizingMaskIntoConstraints = false
        return stk
    }()
    
    let name:UILabel = {
        let lbl = UILabel()
        lbl.text = "Good Food Name".uppercased()
        lbl.font = .systemFont(ofSize: 20)
        lbl.lineBreakMode = .byWordWrapping
        lbl.numberOfLines = 2
        lbl.textColor = kFontColorActive
        return lbl
    }()
    
    let foodShortDescription:UITextView = {
        let desc  = UITextView()
        desc.textColor = kFontColorHeading
        desc.backgroundColor = .clear
        desc.text = "Lorem Ipsum Site amente sit de bla bla bla bla bla and more bla...."
        desc.isScrollEnabled = false
        desc.translatesAutoresizingMaskIntoConstraints  = false
        desc.textContainer.lineBreakMode = .byTruncatingTail
        desc.textContainer.size = desc.bounds.size
        desc.textContainer.lineFragmentPadding = 0
        desc.font = .systemFont(ofSize: 14)
        return desc
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(hStack)
        hStack.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(20)
            make.right.bottom.equalToSuperview().offset(-20)
        }
        
        hStack.addSubview(dpFrame)
        dpFrame.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(150)
        }
        
        dpFrame.addSubview(foodImage)
        dpFrame.clipsToBounds = true
        dpFrame.layer.cornerRadius = 75
        dpFrame.layer.borderWidth = 4
        dpFrame.layer.borderColor = kPrimaryColor.cgColor
        foodImage.snp.makeConstraints { make in
            make.top.left.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        hStack.addSubview(detailView)
        detailView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalTo(dpFrame.snp.right).offset(15)
            make.right.bottom.equalToSuperview()
    
        }
        detailView.addSubview(name)
        name.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(20)
        }
        detailView.addSubview(foodShortDescription)
        foodShortDescription.snp.makeConstraints { make in
            make.left.equalTo(dpFrame.snp.right).offset(15)
            make.right.equalToSuperview()
            make.top.equalTo(name.snp.bottom)
            make.height.equalTo(70)
        }
        let time = InfoTag()
        time.icon.image = UIImage(systemName: "clock")
        time.text.text = "20 min"
        detailView.addSubview(time)
        time.snp.makeConstraints { make in
            make.top.equalTo(foodShortDescription.snp.bottom)
            make.left.equalTo(dpFrame.snp.right).offset(15)
            make.height.equalTo(20)
        }
        let cal = InfoTag()
        cal.icon.image = UIImage(systemName: "bolt.shield")
        cal.text.text = "200 Cal"
        detailView.addSubview(cal)
        cal.snp.makeConstraints { make in
            make.left.equalTo(time.snp.right).offset(10)
            make.top.equalTo(foodShortDescription.snp.bottom)
            make.height.equalTo(20)
        }
    }
    
    
}
