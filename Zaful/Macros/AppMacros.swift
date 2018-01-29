//
//  WZHAppMacros.swift
//  WuZhouHuiSwift
//
//  Created by QianHan on 2017/4/8.
//  Copyright © 2017年 karl.luo. All rights reserved.
//

/************* App规范参数宏定义 **********/

import Foundation
import UIKit

public struct AppMacros {
    
    fileprivate init(){}
    static let version: String = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
    static let tokenKey: String = "tokenKey"
    
    /************* 字体大小 *************/
    static let bigFontSize: CGFloat  = 18.0
    static let mainFontSize: CGFloat = 14.0
    static let subFontSize: CGFloat  = 13.0
    static let sub1FontSize: CGFloat = 12.0
    static let timeFontSize: CGFloat = 10.0
    
    static let bigFont: UIFont  = UIFont.systemFont(ofSize: bigFontSize)
    static let mainFont: UIFont = UIFont.systemFont(ofSize: mainFontSize)
    static let subFont: UIFont  = UIFont.systemFont(ofSize: subFontSize)
    static let sub1Font: UIFont = UIFont.systemFont(ofSize: sub1FontSize)
    static let timeFont: UIFont = UIFont.systemFont(ofSize: timeFontSize)
    
    /************* 字体颜色 *************/
    static let mainTextColor: UIColor = UIColor.qh_colorWithHex(hexColor: 0x333333)
    static let subTextColor: UIColor  = UIColor.qh_colorWithHex(hexColor: 0x999999)
    static let weakTextColor: UIColor = UIColor.qh_colorWithHex(hexColor: 0xcccccc)
    
    /************* 其他颜色 *************/
    static let separetorLineColor: UIColor = UIColor.qh_colorWithHex(hexColor: 0xd8d8d8)
    static let mainColor: UIColor = UIColor.qh_colorWithHex(hexColor: 0xffda35)
    static let mainBackgroundColor: UIColor = UIColor(red: 247.0 / 255.0,
                                                      green: 248.0 / 255.0,
                                                      blue: 249.0 / 255.0,
                                                      alpha: 1.0)
    
    static let separetorHeight: CGFloat = 1.0
    static let viewBeginTag: NSInteger  = 10000
    static let baseMargin: CGFloat      = 5.0
    static let animationTime: CGFloat   = 0.25
}

		
