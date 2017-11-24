//
//  HomeRequest.swift
//  Zaful
//
//  Created by QianHan on 2017/11/23.
//  Copyright © 2017年 karl.luo. All rights reserved.
//

import Foundation
import Moya

enum HomeRequest {
    case homeMenu      // 频道菜单
}

extension HomeRequest: TargetType {
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
        var parameters: [String : Any] = ["lang" : "en", "version": APPMACROS_APP_VERSION!, "token": ""]
        var isEnc = false
        switch self {
        case .homeMenu:
            isEnc = false
            parameters["action"] = "channel/get_channel_list"
            parameters["is_enc"] = String(isEnc)
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type" : "application/json"];
    }
    
    
}
