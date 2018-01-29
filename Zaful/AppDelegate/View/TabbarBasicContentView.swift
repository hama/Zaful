//
//  MainTabBarViewController.swift
//  Zaful
//
//  Created by QianHan on 2017/11/20.
//  Copyright © 2017年 karl.luo. All rights reserved.
//

import UIKit
import ESTabBarController_swift

class TabbarBasicContentView: ESTabBarItemContentView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = AppMacros.subTextColor
        iconColor = AppMacros.subTextColor
        
        highlightTextColor = .black
        highlightIconColor = .black
        badgeColor         = AppMacros.mainColor
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
