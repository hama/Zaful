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
        textColor = APPMACROS_SUB1_TEXTCOLOR
        iconColor = APPMACROS_SUB1_TEXTCOLOR
        
        highlightTextColor = .black
        highlightIconColor = .black
        badgeColor         = APPMACROS_BAGBADVALUE_COLOR
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
