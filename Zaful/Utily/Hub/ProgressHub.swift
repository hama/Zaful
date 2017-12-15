//
//  ProgressHub.swift
//  LibrarySwift
//
//  Created by 罗坤 on 2017/5/3.
//  Copyright © 2017年 Qianhan. All rights reserved.
//

import Foundation
import UIKit

final class ProgressHub: NSObject {
    
    private let margin:CGFloat = 15.0
    
    private var backgroundView:UIView?
    private var logoImageView:UIImageView         = UIImageView()
    private var pinkLayer: CAShapeLayer           = CAShapeLayer()
    private var pinkBackgroundLayer: CAShapeLayer = CAShapeLayer()
    
    private var containerView:UIView = UIView()
    private var tipLabel:UILabel     = UILabel()
    private var logoImage: UIImage   = UIImage(named: "loading_image_center")!
    private var pinkColor            = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
    
    static let shared = ProgressHub()
    
    private override init() {
    }
    
    deinit {
        ProgressHub.shared.pinkLayer.removeAllAnimations()
    }
    
    /// 设置加载logo
    func logoImage(_ image: UIImage) {
        logoImage = image;
    }
    
    func pinkColor(_ pinkColor: UIColor) {
        self.pinkColor = pinkColor
    }
    
    /// 展示加载
    class func show() -> Void {
        if ProgressHub.shared.backgroundView == nil {
            ProgressHub.shared.initBackgrounView()
        }
        UIApplication.shared.keyWindow!.addSubview(ProgressHub.shared.backgroundView!)
        ProgressHub.shared.addPinkAnimation()
    }
    
    /// 展示提示
    ///
    /// - Parameter statusString: 提示内容
    class func showStatus(statusString: String) -> Void {
        if ProgressHub.shared.backgroundView != nil {
            ProgressHub.dismiss()
        }
        
        if statusString.isEmpty {
            return
        }
        
        ProgressHub.shared.initTipBackgroundView()
        UIApplication.shared.windows.last?.addSubview(ProgressHub.shared.containerView)
        ProgressHub.shared.showTipString(tipString: statusString)
    }
    
    class func dismiss() -> Void {
        if ProgressHub.shared.backgroundView != nil {
            ProgressHub.shared.backgroundView!.removeFromSuperview()
        }
        ProgressHub.shared.containerView.removeFromSuperview()
    }
    
    // MARK: 初始化
    private func initBackgrounView() -> Void {
        let width = CGFloat(64.0)
        self.backgroundView        = UIView()
        self.backgroundView!.frame = CGRect(x: (UIScreen.main.bounds.size.width - width) / 2,
                                            y: (UIScreen.main.bounds.size.height - width) / 2,
                                            width: width,
                                            height: width);
        
        self.initLogoImageView()
        self.initPinkImageView()
    }
    
    private func initLogoImageView() -> Void {
        let imageWidth:CGFloat   = 16.0
        self.logoImageView.frame = CGRect(x: (self.backgroundView!.frame.size.width - imageWidth) / 2,
                                          y: (self.backgroundView!.frame.size.height - imageWidth) / 2,
                                          width: imageWidth,
                                          height: imageWidth)
        self.logoImageView.backgroundColor = UIColor.clear
        self.logoImageView.clipsToBounds   = true
        self.logoImageView.image           = logoImage
        self.logoImageView.layer.cornerRadius = imageWidth / 2;
        self.backgroundView!.addSubview(self.logoImageView)
    }
    
    private func initPinkImageView() -> Void {
        
        let width:CGFloat = logoImageView.frame.size.width + 4.0
        
        let circlePath = UIBezierPath()
        circlePath.addArc(withCenter: CGPoint(x: width / 2.0, y: width / 2.0), radius: width / 2.0, startAngle: 0.0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
        pinkBackgroundLayer.frame = CGRect(x: (self.backgroundView!.frame.size.width - width) / 2, y: (self.backgroundView!.frame.size.height - width) / 2, width: width, height: width)
        pinkBackgroundLayer.fillColor = UIColor.clear.cgColor
        pinkBackgroundLayer.path      = circlePath.cgPath
        let colors: [CGFloat] = pinkColor.cgColor.components!
        if colors.count >= 4 {
            pinkBackgroundLayer.strokeColor = UIColor(red: colors[0], green: colors[1], blue: colors[2], alpha: 0.3).cgColor
        } else {
            pinkBackgroundLayer.strokeColor = UIColor(red: colors[0], green: colors[0], blue: colors[0], alpha: 0.3).cgColor
        }
        pinkBackgroundLayer.lineWidth   = 1.5
        pinkBackgroundLayer.strokeStart = 0.0
        pinkBackgroundLayer.strokeEnd   = 1.0
        backgroundView?.layer.addSublayer(pinkBackgroundLayer)
        
        pinkLayer.frame = CGRect(x: (self.backgroundView!.frame.size.width - width) / 2, y: (self.backgroundView!.frame.size.height - width) / 2, width: width, height: width)
        pinkLayer.fillColor       = UIColor.clear.cgColor
        pinkLayer.path            = circlePath.cgPath
        pinkLayer.strokeColor     = pinkColor.cgColor
        pinkLayer.lineWidth       = 1.5
        pinkLayer.strokeStart     = 0.0
        pinkLayer.strokeEnd       = 0.35
        backgroundView!.layer.addSublayer(pinkLayer)
    }
    
    private func initTipBackgroundView() -> Void {
        initContainerView()
        initTipLabel()
    }
    
    private func initContainerView() -> Void {
        
        self.containerView.frame = CGRect.zero
        self.containerView.layer.cornerRadius  = 5.0
        self.containerView.layer.masksToBounds = true
        containerView.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.80)
    }
    
    private func initTipLabel() -> Void {
        
        self.tipLabel.textColor     = UIColor.white
        self.tipLabel.font          = UIFont.systemFont(ofSize: 14.0)
        self.tipLabel.textAlignment = NSTextAlignment.left
        self.tipLabel.numberOfLines = 0
        containerView.addSubview(self.tipLabel)
    }
    
    private func addPinkAnimation() -> Void {
        let timeFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        let baseAnimation:CABasicAnimation = CABasicAnimation.init(keyPath: "transform.rotation.z")
        baseAnimation.fromValue      = NSNumber(value: 0.0)
        baseAnimation.toValue        = NSNumber(value: 2 * Double.pi)
        baseAnimation.repeatCount    = .infinity
        baseAnimation.duration       = 0.6
        baseAnimation.timingFunction = timeFunction
        pinkLayer.add(baseAnimation, forKey: "rotationZ")
    }
    
    private func showTipString(tipString: String) -> Void {
        
        let maxWidth:CGFloat      = UIScreen.main.bounds.size.width - 60.0;
        self.tipLabel.text        = tipString
        let statusString:NSString = tipString as NSString
        let size:CGSize           = statusString.boundingRect(with: CGSize(width: maxWidth - ProgressHub.shared.margin * 2,
                                                                           height: CGFloat(MAXFLOAT)),
                                                              options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                                              attributes: [NSAttributedStringKey.font: self.tipLabel.font],
                                                              context: nil).size
        
        var containerWidth:CGFloat  = size.width + ProgressHub.shared.margin * 2.0
        let containerHeight:CGFloat = size.height + 10.0 * 2.0
        containerWidth = containerWidth < 100.0 ? 100.0 : containerWidth
        ProgressHub.shared.containerView.frame = CGRect(x: ((UIScreen.main.bounds.size.width) - containerWidth) / 2,
                                                        y: ((UIScreen.main.bounds.size.height) - containerHeight) / 2,
                                                        width: containerWidth,
                                                        height: containerHeight)
        ProgressHub.shared.tipLabel.frame = CGRect(x: (containerWidth - size.width) / 2,
                                                   y: 10.0,
                                                   width: size.width,
                                                   height: size.height)
        
        let animationTime:TimeInterval = 0.5 + 0.1 * Double(statusString.length) > 3.5 ? 3.5 : 0.5 + 0.1 * Double(statusString.length)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + animationTime) {
            
            ProgressHub.shared.containerView.removeFromSuperview()
        }
    }
}
