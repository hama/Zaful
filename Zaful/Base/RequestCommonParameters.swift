//
//  RequestCommonParameters.swift
//  Zaful
//
//  Created by QianHan on 2017/12/9.
//  Copyright © 2017年 karl.luo. All rights reserved.
//

// 网络请求公共参数
import Foundation

final class RequestCommonParameters {
    class func parameters() -> [String: Any] {
        let parameters: [String : Any] = ["lang" : LocalizationMannager.share.languageCode,
                                          "version": APPMACROS_APP_VERSION!,
                                          "token": LoginMannager.share.token,
                                          "is_enc": false]
        return parameters
    }
}
