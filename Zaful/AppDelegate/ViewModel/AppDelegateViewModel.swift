//
//  AppDelegateViewModel.swift
//  Zaful
//
//  Created by QianHan on 2017/12/27.
//  Copyright © 2017年 karl.luo. All rights reserved.
//

import Foundation
import Moya
import ObjectMapper
import SwiftyJSON
import RxSwift

final class AppDelegateViewModel: ViewModelProtocol {
    var requestObject: Cancellable?
    
    var responseMessage: String = ""
    var isSuccess: Bool = false
    
    var appNewVersionRequest: Cancellable?
    var exchangeRateRequest: Cancellable?
    var codFilterRequest: Cancellable?
    var hotSearchWordsRequest: Cancellable?
    var userInfoWordsRequest: Cancellable?
    
    func requestCompleteHandle(completeHandle: @escaping () -> Void) {
        let appInitRequet = MoyaProvider<MultiTarget>()
        appNewVersionRequest = appInitRequet.request(MultiTarget(AppDelegateRequest.appNewVersion), completion: { result in
            switch result {
            case let .success(moyaResponse):
                QHLog(moyaResponse.statusCode)
                guard moyaResponse.statusCode == 200 else {
                    self.isSuccess       = false
                    self.responseMessage = "Request Error"
                    return
                }
                break
                
            case let .failure(error):
                break
            }
        })
    }
    
    func cancelRequest() {
        appNewVersionRequest?.cancel()
        exchangeRateRequest?.cancel()
        codFilterRequest?.cancel()
        hotSearchWordsRequest?.cancel()
        userInfoWordsRequest?.cancel()
    }
    
    let requestObj: Observable<JSON> = Observable.create { (observer) -> Disposable in
        
        let appInitRequet = MoyaProvider<MultiTarget>()
        let requestObject: Cancellable = appInitRequet.request(MultiTarget(AppDelegateRequest.appNewVersion), completion: { result in
            
        })
        return Disposables.create {
            requestObject.cancel()
        }
    }
    
}
