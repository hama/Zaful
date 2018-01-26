//
//  AppDelegate.swift
//  Zaful
//
//  Created by QianHan on 2017/11/11.
//  Copyright © 2017年 karl.luo. All rights reserved.
//

import UIKit
import Firebase
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mainTabBarController: MainTabBarController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
        
        configApp()
        rootViewControllerWithLaunchController()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

//MARK: AppDelegate 逻辑操作
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

