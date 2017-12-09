//
//  HomeMainViewController.swift
//  Zaful
//
//  Created by QianHan on 2017/11/20.
//  Copyright © 2017年 karl.luo. All rights reserved.
//

import UIKit
import PageMenu

/// 首页
class HomeMainViewController: BaseViewController {

    let viewModel = HomeMenuViewModel()
    var pageMenu: CAPSPageMenu?
    var menuViewControllers: [BaseViewController]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        requestData()
    }
    
    // MARK: 网络请求
    private func requestData() {
        ProgressHub.show()
        viewModel.requestCompleteHandle {
            ProgressHub.dismiss()
        }
    }
    
    // MARK: private method

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
