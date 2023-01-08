//
//  FoodListTableViewController.swift
//  course-work
//
//  Created by user229897 on 12/31/22.
//

import UIKit
import SnapKit

protocol FoodListTableViewDelegate:AnyObject{
    func didSelectFoodAt(indexPath:IndexPath)
}

class FoodListTableViewController: UIViewController {
    
    weak var delegate: FoodListTableViewDelegate?
    let foodList:UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .clear
        return table;
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(foodList)
        foodList.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(20)
            make.bottom.right.equalToSuperview().offset(-20)
        }
        foodList.dataSource = self
        foodList.delegate = self
        foodList.register(FoodListItem.self, forCellReuseIdentifier: "FoodCard")
        
    }
     
}


extension FoodListTableViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:FoodListItem = tableView.dequeueReusableCell(withIdentifier: "FoodCard", for: indexPath) as! FoodListItem
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.didSelectFoodAt(indexPath: indexPath)
    }
}

class FoodListItem:UITableViewCell{
    
    
    let card:FoodCardView = {
        let card = FoodCardView()
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(card)
        self.selectionStyle = .none
        card.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.left.right.equalToSuperview()
        }
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

