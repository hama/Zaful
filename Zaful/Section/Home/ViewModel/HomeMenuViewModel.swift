//
//  HomeMenuViewModel.swift
//  Zaful
//
//  Created by QianHan on 2017/12/9.
//  Copyright © 2017年 karl.luo. All rights reserved.
//

import Foundation
import Moya
import ObjectMapper
import SwiftyJSON

final class HomeMenuViewModel: NSObject {
    
    // MARK: -网络请求
    var isSuccess       = false;
    var responseMessage = ""
    var menuModels: [HomeMenuModel] = [];
    func requestCompleteHandle(completeHandle:@escaping () -> Void) -> Void {
        let homeRequest = MoyaProvider<HomeRequest>()
        homeRequest.request(.homeMenu) { result in
            switch result {
            case let .success(moyaResponse):
                QHLog(moyaResponse.statusCode)
                guard moyaResponse.statusCode == 200 else {
                    self.isSuccess       = false
                    self.responseMessage = "Request Error"
                    return
                }
                self.isSuccess   = true
                self.analysisMenuData(moyaResponse.data)
                completeHandle()
            case let .failure(error):
                QHLog(error.errorDescription)
                self.isSuccess       = false
                self.responseMessage = error.errorDescription!
                completeHandle()
            }
        }
    }
    
    // MARK: private method
    /// 解析数据
    ///
    /// - Parameter Data: 请求返回的流数据
    private func analysisMenuData(_ data: Data) {
        let responseJson = try! JSON(data: data)
        let resultJson   = responseJson["result"].array
        QHLog(responseJson)
        
        for modelJson in resultJson! {
            let json      = modelJson.dictionaryObject
            let menuModel = HomeMenuModel(JSON: json!)
            self.menuModels.append(menuModel!)
        }
        QHLog(self.menuModels)
    }
}
