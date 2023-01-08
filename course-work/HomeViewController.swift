//
//  HomeViewController.swift
//  course-work
//
//  Created by user229897 on 12/20/22.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

    let greetinSegment = GreetingViewController()
    let bannerSegment = BannerViewController()
    let waveSegment = WaveViewController()
    let categorySegment = CategoryViewController()
    let foodListSegment =  FoodListTableViewController()
    
    let column:UIStackView = {
        let vStack = UIStackView()
        vStack.axis = .horizontal
        vStack.translatesAutoresizingMaskIntoConstraints = false
        return vStack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addGradientBg(self: self)
        self.view.addSubview(column)
        column.snp.makeConstraints { make in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        // ===============================================
        //    Greeting Segment
        // ===============================================
        column.addSubview(greetinSegment.view)
        greetinSegment.view.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(170)
        }
        
        // ===============================================
        //   Banner Segment
        // ===============================================
        column.addSubview(bannerSegment.view)
        bannerSegment.view.snp.makeConstraints { make in
            make.top.equalTo(greetinSegment.view.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(120)
        }
        
        // ===============================================
        //   Wave Segment
        // ===============================================
        column.addSubview(waveSegment.view)
        waveSegment.view.snp.makeConstraints { make in
            make.top.equalTo(bannerSegment.view.snp.bottom).offset(-30)
            make.left.right.equalToSuperview()
            make.height.equalTo(150)
        }
        
        // ===============================================
        //   Category Segment
        // ===============================================
        column.addSubview(categorySegment.view)
        categorySegment.view.snp.makeConstraints { make in
            make.top.equalTo(waveSegment.view.snp.bottom).offset(-70)
            make.left.equalToSuperview()
            make.right.equalToSuperview();
            make.height.equalTo(60)
        }
        
        // ===============================================
        //   Food List Segment
        // ===============================================
        column.addSubview(foodListSegment.view)
        foodListSegment.view.snp.makeConstraints { make in
            make.top.equalTo(categorySegment.view.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        foodListSegment.delegate = self
    }
    

}

extension HomeViewController:FoodListTableViewDelegate{
    func didSelectFoodAt(indexPath: IndexPath) {
        self.navigationController?.pushViewController(FoodDetailedViewController(), animated: true)
    }
    
    
}
