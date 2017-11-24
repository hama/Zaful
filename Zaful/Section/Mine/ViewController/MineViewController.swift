//
//  MineViewController.swift
//  Zaful
//
//  Created by QianHan on 2017/11/20.
//  Copyright © 2017年 karl.luo. All rights reserved.
//

import UIKit

/// 个人中心
class MineViewController: BaseViewController {

    var loginButton: UIButton {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 100.0, y: 100.0, width: 120.0, height: 44.0);
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
        return button
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() -> Void {
        view.addSubview(loginButton)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @objc func login() -> Void {
        let loginViewController = LoginViewController()
        navigationController?.present(loginViewController, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

