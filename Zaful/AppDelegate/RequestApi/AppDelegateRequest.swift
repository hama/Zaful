//
//  AppDelegateRequest.swift
//  Zaful
//
//  Created by QianHan on 2017/12/27.
//  Copyright © 2017年 karl.luo. All rights reserved.
//

import Foundation
import Moya

enum AppDelegateRequest {
    case appNewVersion   // 版本更新接口
    case exchangeRate    // 汇率列表
    case codFilter       // cod折扣过滤(货到付款)
    case hotSearchWords  // 热搜词列表
    case userInfo        // 用户信息
}

extension AppDelegateRequest: TargetType {
    var baseURL: URL {
        return URL(string: String.rootURL())!
    }
    
    var path: String {
        switch self {
        default:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        default:
            return .post
        }
    }
    
    /// 单元测试等等需要的假数据
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
    
    var task: Task {
        var parameters = RequestCommonParameters.parameters()
        switch self {
        case .appNewVersion:
            parameters["action"] = "common/initialization"
        case .exchangeRate:
            parameters["action"] = "common/get_exchange_rate"
        case .codFilter:
            parameters["action"] = "common/get_cp_currency"
        case .hotSearchWords:
            parameters["action"] = "search/getHotWord"
        case .userInfo:
            parameters["action"] = "user/get_user_info"
        }
        QHLog("请求URL: \(self.baseURL) \n 请求参数：\(parameters)")
        return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
    }
    
    var headers: [String : String]? {
        return ["Content-Type" : "application/json"];
    }
}
