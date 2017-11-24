//
//  LoginViewController.swift
//  Zaful
//
//  Created by QianHan on 2017/11/21.
//  Copyright © 2017年 karl.luo. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    var completeHandle: (() -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        let tagGesture = UITapGestureRecognizer(target: self, action: #selector(disMiss))
        view.addGestureRecognizer(tagGesture)
    }
    
    @objc func disMiss() -> Void {
        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
