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
class HomeMainViewController: ButtonBarPagerTabStripViewController {
    // MARK: 变量
    let viewModel = HomeMenuViewModel()
    var menuViewControllers: [BaseViewController] = [BaseViewController]()
    
    // MARK: 生命周期
    override func viewDidLoad() {
        self.edgesForExtendedLayout = UIRectEdge.init(rawValue: 0)
        let menuColor = UIColor(red: 183.0 / 255.0, green: 96.0 / 255.0, blue: 42.0 / 255.0, alpha: 1.0)
        settings.style.buttonBarItemFont            = APPMACROS_MAIN_FONT
        settings.style.buttonBarItemTitleColor      = APPMACROS_MAIN_TEXTCOLOR
        settings.style.buttonBarHeight              = 44.0
        settings.style.buttonBarBackgroundColor     = .white
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.selectedBarHeight            = 1.5
        settings.style.buttonBarRightContentInset   = 10.0
        settings.style.buttonBarLeftContentInset    = 10.0
        
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = APPMACROS_MAIN_TEXTCOLOR
            newCell?.label.textColor = menuColor
        }
        
        super.viewDidLoad()
        title = LocalizedString("home_title")
        buttonBarView.selectedBar.backgroundColor = menuColor
        buttonBarView.backgroundColor = .white
        setupView()
        layouterViews()
        requestData()
        
    }
    
    // MARK: 网络请求
    private func requestData() {
        ProgressHub.show()
        viewModel.requestCompleteHandle {
            ProgressHub.dismiss()
            self.reloadPagerTabStripView()
        }
    }
    
    // MARK: 私有方法

    // MARK: 初始化视图
    func initPageMenu() -> Void {
        menuViewControllers.removeAll()
        guard viewModel.menuModels.count > 0 else {
            let homeViewController   = HomeViewController()
            homeViewController.title = "Home"
            menuViewControllers.append(homeViewController)
            return;
        }
        
        for menuModel in viewModel.menuModels {
            if menuModel.jumbType!.count > 0 {
                let virtulViewController   = VirtualCategoryViewController()
                virtulViewController.title = menuModel.menuTitle
                menuViewControllers.append(virtulViewController)
            } else {
                if menuModel.menuId == nil {
                    let homeViewController          = HomeViewController()
                    homeViewController.channelTitle = menuModel.menuTitle!
                    menuViewControllers.append(homeViewController)
                } else {
                    let channelViewController          = ChannelViewController()
                    channelViewController.channelTitle = menuModel.menuTitle!
                    channelViewController.channelId    = menuModel.menuId!
                    menuViewControllers.append(channelViewController)
                }
            }
        }
    }
    
    // MARK: - PagerTabStripDataSource
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        initPageMenu()
        return menuViewControllers
    }
    
    override func reloadPagerTabStripView() {
        super.reloadPagerTabStripView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension HomeMainViewController: InstanceViewsProtocol {
    func setupView() {
    }
    
    func layouterViews() {
    }
}

