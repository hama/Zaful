//
//  LoginMannage.swift
//  Zaful
//
//  Created by QianHan on 2017/12/9.
//  Copyright © 2017年 karl.luo. All rights reserved.
//

import Foundation
import KeychainAccess

final class LoginMannager {
    private init() {}
    static let share  = LoginMannager()
    
    /// 是否登录状态 false: 未登录 true: 已登录
    var isLogin: Bool = false
    
    /// 登录的 token
    var token: String {
        get {
            let keyChain = Keychain(service: String.rootURL())
            let tokenKey = keyChain[AppMacros.tokenKey]
            guard (tokenKey != nil) else {
                return ""
            }
            return tokenKey!
        }
        
        set(newToken) {
            let keyChain = Keychain(service: String.rootURL())
            keyChain[AppMacros.tokenKey] = newToken
        }
    }
}
