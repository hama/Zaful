//
//  HomeMainViewController.swift
//  Zaful
//
//  Created by QianHan on 2017/11/20.
//  Copyright © 2017年 karl.luo. All rights reserved.
//

import UIKit
import XLPagerTabStrip

/// 首页
class HomeMainViewController: BarPagerTabStripViewController {
    // MARK: 变量
    let viewModel = HomeMenuViewModel()
    var menuViewControllers: [BaseViewController] = [HomeViewController()]
    
    // MARK: 生命周期
    override func viewDidLoad() {
        let menuColor = UIColor(red: 183.0 / 255.0, green: 96.0 / 255.0, blue: 42.0 / 255.0, alpha: 1.0)
        settings.style.selectedBarBackgroundColor = menuColor
        super.viewDidLoad()
        title = "Home"
        requestData()
    }
    
    // MARK: 网络请求
    private func requestData() {
        ProgressHub.show()
        viewModel.requestCompleteHandle {
            ProgressHub.dismiss()
            self.initPageMenu()
            self.reloadPagerTabStripView()
        }
    }
    
    // MARK: 私有方法

    // MARK: 初始化视图
    func initPageMenu() -> Void {
        menuViewControllers.removeAll()
        for menuModel in viewModel.menuModels {
            if menuModel.jumbType!.count > 0 {
                let virtulViewController   = VirtualCategoryViewController()
                virtulViewController.title = menuModel.menuTitle
                menuViewControllers.append(virtulViewController)
            } else {
                if menuModel.menuId == nil {
                    let homeViewController   = HomeViewController()
                    homeViewController.title = menuModel.menuTitle
                    menuViewControllers.append(homeViewController)
                } else {
                    let channelViewController       = ChannelViewController()
                    channelViewController.title     = menuModel.menuTitle
                    channelViewController.channelId = menuModel.menuId!
                    menuViewControllers.append(channelViewController)
                }
            }
        }
    }
    
    // MARK: - PagerTabStripDataSource
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        return menuViewControllers
    }
    
    override func reloadPagerTabStripView() {
        super.reloadPagerTabStripView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

