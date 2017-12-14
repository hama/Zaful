//
//  HomeViewController.swift
//  Zaful
//
//  Created by QianHan on 2017/12/9.
//  Copyright © 2017年 karl.luo. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class HomeViewController: BaseViewController, IndicatorInfoProvider {
    // MARK: 变量
    var channelTitle: String = ""
    let box = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = channelTitle
    }

    // MARK: IndicatorInfoProvider
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        let info: IndicatorInfo = IndicatorInfo(title: channelTitle)
        return info
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
