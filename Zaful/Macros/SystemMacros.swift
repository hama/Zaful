//
//  SystemMacros.swift
//  WuZhouHuiSwift
//
//  Created by QianHan on 2017/5/2.
//  Copyright © 2017年 karl.luo. All rights reserved.
//

/************ App系统参数宏定义 ********/
import Foundation
import UIKit

struct SystemMacros {
    static let is_iOS10: Bool        = (UIDevice.current.systemVersion as NSString).doubleValue >= 10.0
    static let screenWidth: CGFloat  = UIScreen.main.bounds.size.width
    static let screenHeight: CGFloat = UIScreen.main.bounds.size.height
}

/*********** 公共方法 **************/
// 以375.0(iPone6/7)为基准宽度适配
func FITSCREEN(f:CGFloat) -> CGFloat {
    return f / 375.0 * SystemMacros.screenWidth
}

func QHLog<T>(_ message: T, file: String = #file, funcName: String = #function, lineNum: Int = #line) {
    #if DEBUG
        let fileName             = (file as NSString).lastPathComponent
        let dateFormatter        = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss.SSS"
        let dateString           = dateFormatter.string(from: Date())
        
        print(" ------->fileName：\(fileName)\n ------->funcName：\(funcName)\n ------->line：\(lineNum)\n ------->time：\(dateString)\n ------->content：\(message)\n")
    #endif
}
