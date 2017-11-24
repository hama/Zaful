//
//  HomeMenuModel.swift
//  Zaful
//
//  Created by QianHan on 2017/11/24.
//  Copyright © 2017年 karl.luo. All rights reserved.
//

import Foundation
import ObjectMapper
import Moya

final class HomeMenuModel: Mappable {
    
    var menuId: String?
    var menuTitle: String?
    var jumbType: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        menuId <- map["channel_id"]
        menuTitle <- map["channel_title"]
        jumbType <- map["jump_type"]
    }
    
    func requestCompleteHandle(completeHandle:(_ message: String, _ isSuccess: Bool) -> Void) -> Void {
        let homeRequest = MoyaProvider<HomeRequest>()
        homeRequest.request(.homeMenu) { result in
            switch result {
//                case let .suc
            }
        }
    }
}
