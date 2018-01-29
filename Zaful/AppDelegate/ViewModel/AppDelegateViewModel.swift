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

final class AppDelegateViewModel: ViewModelProtocol {
    var requestObject: Cancellable?
    
    var responseMessage: String = ""
    
    func requestCompleteHandle(completeHandle: @escaping () -> Void) {
        let appInitRequet = MoyaProvider<MultiTarget>()
        requestObject = appInitRequet.request(MultiTarget(AppDelegateRequest.appNewVersion), completion: { result in
            
        })
    }
    
    func cancelRequest() {
        requestObject?.cancel()
    }
    
}
