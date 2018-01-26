//
//  BaseViewModel.swift
//  Zaful
//
//  Created by QianHan on 2017/12/27.
//  Copyright © 2017年 karl.luo. All rights reserved.
//

import Foundation
import Moya
import ObjectMapper
import SwiftyJSON

class BaseViewModel: NSObject {
    // MARK: -网络请求
    /// 请求是否成功
    var isSuccess       = false
    /// 请求返回的提示语
    var responseMessage = ""
    /// 请求函数
    func requestCompleteHandle(completeHandle:@escaping () -> Void) -> Void {
    }
    // 取消请求函数
    func cancelRequest() {
    }
}
