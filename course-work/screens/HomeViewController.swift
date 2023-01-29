//
//  HomeViewController.swift
//  course-work
//
//  Created by user229897 on 12/20/22.
//

import UIKit
import SnapKit
import Combine

class HomeViewController: UIViewController {
    
    

    let greetinSegment = GreetingViewController()
    let bannerSegment = BannerViewController()
    let waveSegment = WaveViewController()
    let categorySegment = CategoryViewController()
    
    var homeModel = HomeViewModel()
    var subscriptions:[AnyCancellable] = [AnyCancellable]()
    var foodListSegment:FoodListTableViewController = FoodListTableViewController()
    var recipeRef:[Recipe] = [Recipe]()
    
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
        categorySegment.delegate = self
        
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
        foodListSegment.navC = self.navigationController
        
        loadData()
    }
    
    func loadData(){
        homeModel.getRecipes()
        homeModel.$recipeList
            .receive(on: DispatchQueue.main)
            .sink { recipes in
                
                DispatchQueue.main.async {
                    self.foodListSegment.listOfRecipes = recipes
                    self.recipeRef = recipes
                    self.foodListSegment.foodList.reloadData()
                    
                }
            }.store(in: &subscriptions)
    }
    func filterRecipeByCuisineId(id: Int)->[Recipe]{
        return recipeRef.filter { recipe in
            Int(recipe.cuisineID) == id
        }
    }

}

extension HomeViewController:FoodListTableViewDelegate,CategoryTabDelegate{
    func categoryChanged(id: Int) {
        let filteredRecipeList = filterRecipeByCuisineId(id: id)
        self.foodListSegment.listOfRecipes = filteredRecipeList
        self.foodListSegment.foodList.reloadData()
    }
        
    func didSelectFoodAt(indexPath: IndexPath, recipe:Recipe) {
        print(recipe)
        self.navigationController?.pushViewController(FoodDetailedViewController(recipe: recipe), animated: true)
    }
    
    
    
}
