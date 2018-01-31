//
//  CODFilterViewModel.swift
//  Zaful
//
//  Created by QianHan on 2018/1/31.
//  Copyright © 2018年 karl.luo. All rights reserved.
//

import Foundation
import Moya
import ObjectMapper
import SwiftyJSON

final class CODFilterViewModel: ViewModelProtocol {
    var requestObject: Cancellable?
    
    var responseMessage: String = ""
    var isSuccess: Bool = false
    
    func requestCompleteHandle() {
        let codFilterRequet = MoyaProvider<AppDelegateRequest>()
        requestObject = codFilterRequet.request(.codFilter, completion: { result in
            switch result {
            case let .success(moyaResponse):
                QHLog(moyaResponse.statusCode)
                guard moyaResponse.statusCode == 200 else {
                    self.isSuccess       = false
                    self.responseMessage = "Request Error"
                    return
                }
                self.isSuccess = true
                break
                
            case let .failure(error):
                self.isSuccess       = false
                self.responseMessage = error.errorDescription!
                break
            }
        })
    }
    
    func cancelRequest() {
        requestObject?.cancel()
    }
}
