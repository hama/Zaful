//
//  ViewModelProtocol.swift
//  Zaful
//
//  Created by QianHan on 2017/12/27.
//  Copyright © 2017年 karl.luo. All rights reserved.
//

import Foundation
import Moya

protocol ViewModelProtocol {
    // MARK: -网络请求
    /// 请求是否成功
    var isSuccess:Bool {get set}
    /// 请求返回的提示语
    var responseMessage:String {get set}
    /// 请求对象
    var requestObject: Cancellable?{get set}
    /// 请求函数
    func requestCompleteHandle(completeHandle:@escaping () -> Void) -> Void
    // 取消请求函数
    func cancelRequest()
}

extension ViewModelProtocol {
    var isSuccess: Bool {
        get {
            return isSuccess
        }
        set {
            isSuccess = newValue
        }
    }
}
