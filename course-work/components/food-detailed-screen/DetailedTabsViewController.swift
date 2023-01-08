//
//  DetailedTabsViewController.swift
//  course-work
//
//  Created by user229897 on 1/5/23.
//

import UIKit

class DetailedTabsViewController: UIPageViewController {
    
   var pages = [UIViewController]()
      
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let page1 = WebContentViewController()
        let page2 = UIViewController()
        
        page1.view.backgroundColor = .green
        page2.view.backgroundColor = .red
        
        pages.append(page1)
        pages.append(page2)
        
        setViewControllers([pages[0]], direction: .forward, animated: true)
        
              
     
    }
   

}


