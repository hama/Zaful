//
//  WZHNavigationViewController.swift
//  WuZhouHuiSwift
//
//  Created by QianHan on 2017/4/11.
//  Copyright © 2017年 karl.luo. All rights reserved.
//

import UIKit
import KeychainAccess
import AMScrollingNavbar

class NavigationViewController: ScrollingNavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let apperance:UINavigationBar = UINavigationBar.appearance()
        apperance.titleTextAttributes = [
            NSAttributedStringKey.foregroundColor: APPMACROS_MAIN_TEXTCOLOR,
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: APPMACROS_BIG_FONTSIZE)
        ];
        self.interactivePopGestureRecognizer?.delegate = self
//        self.scrollingEnabled = false
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 1 {
            self.hidesBottomBarWhenPushed = true
        }

        guard !presentToLoginViewController(viewController) else {
            return
        }
        super.pushViewController(viewController, animated: animated)
        self.interactivePopGestureRecognizer?.isEnabled = false
    }

    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        guard !presentToLoginViewController(viewControllerToPresent) else {
            return
        }
        super.present(viewControllerToPresent, animated: flag, completion: completion)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    /// 是否要先登录
    ///
    /// - Parameter viewController: 要判断的VC
    func presentToLoginViewController(_ viewController: UIViewController) -> Bool {
        if viewController is BaseViewController {
            let currentViewController = viewController as! BaseViewController
            if currentViewController.isNeedLogin()
                && !LoginMannager.share.isLogin {
                let loginViewController: LoginViewController = LoginViewController()
                let loginNavicationController: NavigationViewController = NavigationViewController(rootViewController: loginViewController)
                navigationController?.present(loginNavicationController, animated: true, completion: nil)
                loginViewController.completeHandle = {
                    super.pushViewController(viewController, animated: true)
                }
                return true
            }
        }
        return false
    }
}

//extension NavigationViewController: UIGestureRecognizerDelegate {
//    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
//        if self.viewControllers.count <= 1 {
//            return false
//        }
//        return true
//    }
//}

