//
//  WZHBaseViewController.swift
//  WuZhouHuiSwift
//
//  Created by QianHan on 2017/4/11.
//  Copyright © 2017年 karl.luo. All rights reserved.
//

import UIKit
import Reachability

/// 登录协议，默认都是需要登录
protocol IsLoginProtocal {
    func isNeedLogin() -> Bool
}

class BaseViewController: UIViewController, IsLoginProtocal {
    
    weak var networkNoticeView: UIView?
    var reachability = Reachability()!
    // MARK: life circle
    deinit {
        reachability.stopNotifier()
    }
    
    override func viewDidLoad() {
        self.edgesForExtendedLayout = UIRectEdge.init(rawValue: 0)
        super.viewDidLoad()
        view.backgroundColor = AppMacros.mainBackgroundColor
        initNavLeftItem()
        initNetworkNoticeView()
        startMonitor()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        ProgressHub.dismiss()
    }
    
    //MARK: event response
    @objc func backAction() -> Void {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func networkDidChange(isHidden: Bool) -> Void {
        networkNoticeView?.isHidden = isHidden
        view.bringSubview(toFront: networkNoticeView!)
    }
    
    //MARK: init subview
    private func initNavLeftItem() -> Void {
        guard navigationController != nil && (navigationController?.viewControllers.count)! > 1 else {
            return
        }
        
        let leftItem:UIButton    = UIButton(type: .custom)
        leftItem.frame           = CGRect(x: 0.0, y: 0.0, width: 50.0, height: 44.0)
        leftItem.backgroundColor = UIColor.clear
        leftItem.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: -10.0, bottom: 0.0, right: 20.0)
        leftItem.setImage(UIImage.init(named: "back_arrow"), for: .normal)
        leftItem.addTarget(self, action: #selector(BaseViewController.backAction), for: .touchUpInside)
        
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 44.0, height: 44.0))
        leftView.addSubview(leftItem)
        leftView.isUserInteractionEnabled     = true
        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                       action: #selector(BaseViewController.backAction))
        leftView.addGestureRecognizer(tapGesture)
        
        let leftBarItem:UIBarButtonItem       = UIBarButtonItem(customView: leftView);
        self.navigationItem.leftBarButtonItem = leftBarItem;
    }
    
    private func initNetworkNoticeView() {
        if networkNoticeView == nil {
            let noticeView      = UIView()
            noticeView.isHidden = true
            noticeView.qh_height(30.0)
            noticeView.qh_width(view.qh_width())
            noticeView.qh_x(0.0)
            noticeView.qh_y(0.0)
            noticeView.backgroundColor = UIColor(red: 255.0 / 255.0,
                                                 green: 168.0 / 255.0,
                                                 blue: 0.0 / 255.0,
                                                 alpha: 0.65)
            view.addSubview(noticeView)
            networkNoticeView = noticeView
            
            let noticeLabel             = UILabel(frame: noticeView.bounds)
            noticeLabel.backgroundColor = .clear
            noticeLabel.textColor       = .white
            noticeLabel.font            = AppMacros.mainFont
            noticeLabel.text            = "当前无网络，请检查您的网络设置"
            noticeLabel.qh_x(AppMacros.baseMargin * 2)
            noticeView.addSubview(noticeLabel)
        }
    }
    
    func isNeedLogin() -> Bool {
        return false
    }
    
    /// 网络监听
    private func startMonitor() {
        // 网络可用
        reachability.whenReachable = { reachability in
            self.networkDidChange(isHidden: true)
        }
        // 网络不可用
        reachability.whenUnreachable = { _ in
            self.networkDidChange(isHidden: false)
        }
        
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
