//
//  AppConfigExtensions.swift
//  Zaful
//
//  Created by QianHan on 2018/1/27.
//  Copyright © 2018年 karl.luo. All rights reserved.
//

import Foundation
import IQKeyboardManagerSwift

// MARK: - APP 配置
extension AppDelegate {
    
    /// 设置根 VC
    func rootViewControllerWithTabbarController() -> Void {
        mainTabBarController                = MainTabBarController()
        window?.rootViewController          = mainTabBarController
        mainTabBarController?.selectedIndex = TabbarItemIndex.home.rawValue
    }
    
    /// 设置根 VC
    func rootViewControllerWithLaunchController() -> Void {
        let launchViewController = LaunchViewController()
        window?.rootViewController = launchViewController
    }
    
    /// APP 全局配置
    func configApp() {
        ProgressHub.shared.logoImage(UIImage(named: "hub_loading_logo")!)
        IQKeyboardManager.sharedManager().enable = true
    }
}
