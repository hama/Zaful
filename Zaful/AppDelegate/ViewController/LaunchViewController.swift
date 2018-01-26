//
//  LaunchViewController.swift
//  Zaful
//
//  Created by QianHan on 2017/12/27.
//  Copyright © 2017年 karl.luo. All rights reserved.
//

import UIKit

/// 假启动页
class LaunchViewController: BaseViewController {
    // MARK: 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        initLaunchImageView()
        
    }
    // MARK: 初始化视图
    private func initLaunchImageView() {
        let imageView = UIImageView(frame: UIScreen.main.bounds)
        imageView.backgroundColor = .white;
        imageView.image = UIImage(named: "default_launch")
        view.addSubview(imageView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
