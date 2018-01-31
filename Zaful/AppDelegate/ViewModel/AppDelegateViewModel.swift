//
//  AppDelegateViewModel.swift
//  Zaful
//
//  Created by QianHan on 2018/1/31.
//  Copyright © 2018年 karl.luo. All rights reserved.
//

import Foundation
import RxSwift

final class AppDelegateViewModel: NSObject {
    
    let numbers: Observable<Bool> = Observable.create { observer -> Disposable in
        
        let appVersionViewModel: AppVersionViewModel         = AppVersionViewModel()
        let exchangeRateViewModel: ExChangeRateViewModel     = ExChangeRateViewModel()
        let codFilterViewModel: CODFilterViewModel           = CODFilterViewModel()
        let hotSearchWordsViewModel: HotSearchWordsViewModel = HotSearchWordsViewModel()
        let userInfoViewModel: UserInfoViewModel             = UserInfoViewModel()
        let homeMenuViewModel: HomeMenuViewModel             = HomeMenuViewModel()
        
        // 网络请求
        appVersionViewModel.requestCompleteHandle()
        exchangeRateViewModel.requestCompleteHandle()
        codFilterViewModel.requestCompleteHandle()
        hotSearchWordsViewModel.requestCompleteHandle()
        userInfoViewModel.requestCompleteHandle()
        homeMenuViewModel.requestCompleteHandle()
        
        observer.onNext(appVersionViewModel.isSuccess)
        observer.onNext(exchangeRateViewModel.isSuccess)
        observer.onNext(codFilterViewModel.isSuccess)
        observer.onNext(hotSearchWordsViewModel.isSuccess)
        observer.onNext(userInfoViewModel.isSuccess)
        observer.onNext(homeMenuViewModel.isSuccess)
        observer.onCompleted()
        
        return Disposables.create()
    }
    
    func requestStatus() -> Bool {
        return true
    }
}
