//
//  NSString+MYURL.swift
//  MiYanSwift
//
//  Created by QianHan on 2017/8/1.
//  Copyright © 2017年 karl.luo. All rights reserved.
//

import Foundation
import UIKit

fileprivate let kHost       = "kHost"
fileprivate let kTest       = "kTest"
fileprivate let kPreRelease = "kPreRelease"
fileprivate let kTrunk      = "kTrunk"

extension String {
    
    /// 网络请求的根路径
    ///
    /// - Returns: 请求链接
    static func rootURL() -> String {
        var rootUrl: String = self.hostURL()
        let userDefault = UserDefaults.standard
        
        rootUrl = userDefault.bool(forKey: kHost) ? self.hostURL() : rootUrl
        rootUrl = userDefault.bool(forKey: kTest) ? self.testURL() : rootUrl
        rootUrl = userDefault.bool(forKey: kPreRelease) ? self.preReleaseURL() : rootUrl
        rootUrl = userDefault.bool(forKey: kTrunk) ? self.trunkURL() : rootUrl
        
        return rootUrl
    }
    
    static func hostURL() -> String {
        return "https://app.zaful.com/api_ios/"
    }
    
    static func preReleaseURL() -> String {
        return "https://app.zaful.com/api_ios/"
    }
    
    static func testURL() -> String {
        return "http://app-zaful.com.a.s1.egomsl.com/api_ios/"
    }
    
    static func trunkURL() -> String {
        return "http://app-zaful.com.trunk.s1.egomsl.com/api_ios/"
    }
}
