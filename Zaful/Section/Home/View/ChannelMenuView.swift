//
//  ChannelMenuView.swift
//  Zaful
//
//  Created by QianHan on 2017/12/12.
//  Copyright © 2017年 karl.luo. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class ChannelMenuView: UIView {
    var expandButton: UIButton {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "arrow_down"), for: .normal)
        btn.backgroundColor = .white
        return btn
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setupView()
        layouterViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 
}

extension ChannelMenuView: InstanceViewsProtocol {
    func setupView() {
        addSubview(expandButton)
    }
    
    func layouterViews() {
//        expandButton.snp.makeConstraints { (make) in
//            make.leading.equalTo(self)
//            make.top.equalTo(self)
//            make.bottom.equalTo(self)
//            make.width.equalTo(self.snp.height)
//        }
    }
}
