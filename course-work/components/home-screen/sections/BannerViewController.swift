//
//  BannerViewController.swift
//  course-work
//
//  Created by user229897 on 12/30/22.
//

import UIKit
import SnapKit

class BannerViewController: UIViewController {

    let bannerImage:UIImageView = {
        let banner = UIImageView()
        banner.image = UIImage(named: "category-fast-foods")
        banner.contentMode = .scaleAspectFit
        banner.translatesAutoresizingMaskIntoConstraints = false
        return banner
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.view.backgroundColor = .red
        self.view.addSubview(bannerImage)
        bannerImage.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(20)
            make.height.equalTo(130)
        }
        
        
    }
    

}
