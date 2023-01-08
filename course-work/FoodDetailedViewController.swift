//
//  FoodDetailedViewController.swift
//  course-work
//
//  Created by user229897 on 1/5/23.
//

import UIKit
import SnapKit

class FoodDetailedViewController: UIViewController {

    let header = HeaderViewController()
    let tabs = DetailedTabsViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    let tabHeaders = TabHeadersViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGradientBg(self: self)
        
        // =================================================
        // Header Section
        // =================================================
        view.addSubview(header.view);
        header.view.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.height.equalToSuperview().multipliedBy(0.25)
        }
        // =================================================
        // Tabs Header Section
        // =================================================
        view.addSubview(tabHeaders.view)
        tabHeaders.view.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(header.view.snp.bottom)
            make.height.equalTo(60)
        }
        tabHeaders.delegate = self
        // =================================================
        // Tabs Content Section
        // =================================================
        addChild(tabs)
        view.addSubview(tabs.view)
        tabs.view.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(tabHeaders.view.snp.bottom)
            make.height.equalToSuperview().multipliedBy(0.55)
        }
        tabs.didMove(toParent: self)
        
    }
}
extension FoodDetailedViewController:TabHeaderDelegate{
    func DidTabChanged(indexPath: IndexPath) {
        if indexPath.row < tabs.pages.count {
            tabs.setViewControllers([tabs.pages[indexPath.row]], direction: .forward, animated: true)
        }
    }
    
    
}

