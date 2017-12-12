//
//  ChannelViewController.swift
//  Zaful
//
//  Created by QianHan on 2017/12/9.
//  Copyright © 2017年 karl.luo. All rights reserved.
//

import UIKit
import XLPagerTabStrip

/// 频道
class ChannelViewController: BaseViewController, IndicatorInfoProvider {
    // MARK: 变量
    var channelId: String    = ""
    var channelTitle: String = ""
    
    // MARK: 生命周期
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
        // Dispose of any resources that can be recreated.
    }
}
