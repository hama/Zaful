//
//  MainTabBarViewController.swift
//  Zaful
//
//  Created by QianHan on 2017/11/20.
//  Copyright © 2017年 karl.luo. All rights reserved.
//

import UIKit
import ESTabBarController_swift

class MainTabBarController: ESTabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabarController()
    }

    private func setupTabarController() -> Void {
        
        let homeMainViewController = HomeMainViewController()
        childViewController(homeMainViewController, "Home", UIImage(named: "tabbar_home_normal")!, UIImage(named: "tabbar_home_selected")!)
        
        let categorysViewController = CategorysViewController()
        childViewController(categorysViewController, "Categorys", UIImage(named: "tabbar_category_normal")!, UIImage(named: "tabbar_category_selected")!)
        
        let communityViewController = CommunityViewController()
        childViewController(communityViewController, "Z-Me", UIImage(named: "tabbar_z-me_normal")!, UIImage(named: "tabbar_z-me_selected")!)
        
        let favoriteViewController = FavoriteViewController()
        childViewController(favoriteViewController, "Favorite", UIImage(named: "tabbar_favorite_normal")!, UIImage(named: "tabbar_favorite_normal")!)
        
        let mineViewController = MineViewController()
        childViewController(mineViewController, "Mine", UIImage(named: "tabbar_mine_normal")!, UIImage(named: "tabbar_mine_selected")!)
    }
    
    private func childViewController(_ viewController: UIViewController,
                                     _ title: String,
                                     _ normalImage: UIImage,
                                     _ selectedImage: UIImage) -> Void {
        
        let navigationBar = NavigationViewController.init(rootViewController: viewController)
        navigationBar.tabBarItem = ESTabBarItem.init(TabbarBouncesContentView(), title: title, image: normalImage, selectedImage: selectedImage)
        viewController.title = title
        self.addChildViewController(navigationBar)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
