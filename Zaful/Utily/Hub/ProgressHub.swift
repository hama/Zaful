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
    
    private var tipBackgrountView:UIView?
    private var containerView:UIView = UIView()
    private var tipLabel:UILabel     = UILabel()
    private var logoImage: UIImage   = UIImage(named: "loading_image_center")!
    private var pinkColor            = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
    
    static var shared: ProgressHub {
        struct Static {
            static let instance: ProgressHub = ProgressHub()
        }
        return Static.instance
    }
    
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
        
        if ProgressHub.shared.tipBackgrountView == nil {
            ProgressHub.shared.initTipBackgroundView()
        }
        
        UIApplication.shared.windows.last?.addSubview(ProgressHub.shared.tipBackgrountView!)
        ProgressHub.shared.showTipString(tipString: statusString)
    }
    
    class func dismiss() -> Void {
        if ProgressHub.shared.backgroundView != nil {
            ProgressHub.shared.backgroundView!.removeFromSuperview()
        }
    }
    
    // MARK: 初始化
    private func initBackgrounView() -> Void {
        
        self.backgroundView        = UIView()
        self.backgroundView!.frame = UIScreen.main.bounds
        self.backgroundView?.isUserInteractionEnabled = true
        
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
        circlePath.addArc(withCenter: CGPoint(x: width / 2.0, y: width / 2.0), radius: width / 2.0, startAngle: 0.0, endAngle: CGFloat(Double.pi * 2), clockwise: false)
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
        self.backgroundView!.layer.addSublayer(pinkLayer)
    }
    
    private func initTipBackgroundView() -> Void {
        
        self.tipBackgrountView        = UIView()
        self.tipBackgrountView!.frame = UIScreen.main.bounds
        
        self.initContainerView()
        self.initTipLabel()
    }
    
    private func initContainerView() -> Void {
        
        self.containerView.frame = CGRect.zero
        self.containerView.layer.cornerRadius  = 5.0
        self.containerView.layer.masksToBounds = true
        self.containerView.center              = (tipBackgrountView?.center)!
        containerView.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.0)
        tipBackgrountView?.addSubview(self.containerView)
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
        baseAnimation.repeatCount    = MAXFLOAT
        baseAnimation.duration       = 0.5
        baseAnimation.timingFunction = timeFunction
        pinkLayer.add(baseAnimation, forKey: "baseAnimation")
        
//        let startAnimation: CABasicAnimation = CABasicAnimation(keyPath: "strokeStart")
//        startAnimation.duration             = 0.8
//        startAnimation.fromValue            = NSNumber(value: 0.0)
//        startAnimation.toValue              = NSNumber(value: 0.25)
//        startAnimation.timingFunction       = timeFunction;
//
//        let endAnimation: CABasicAnimation  = CABasicAnimation(keyPath: "strokeEnd")
//        endAnimation.duration             = 0.8
//        endAnimation.fromValue            = NSNumber(value: 0.0)
//        endAnimation.toValue              = NSNumber(value: 1.0)
//        endAnimation.timingFunction       = timeFunction;
//
//
//        let startAnimation1: CABasicAnimation = CABasicAnimation(keyPath: "strokeStart")
//        startAnimation1.duration             = 0.4
//        startAnimation.beginTime             = 0.8
//        startAnimation1.fromValue            = NSNumber(value: 0.25)
//        startAnimation1.toValue              = NSNumber(value: 1.0)
//        startAnimation1.timingFunction       = timeFunction;
//
//        let endAnimation1: CABasicAnimation  = CABasicAnimation(keyPath: "strokeEnd")
//        endAnimation1.duration             = 0.4
//        endAnimation1.beginTime            = 0.8
//        endAnimation1.fromValue            = NSNumber(value: 1.0)
//        endAnimation1.toValue              = NSNumber(value: 1.0)
//        endAnimation1.timingFunction       = timeFunction;
//
//        let groupAnimaiton: CAAnimationGroup = CAAnimationGroup()
//        groupAnimaiton.duration = 1.2
//        groupAnimaiton.repeatCount = MAXFLOAT
//        groupAnimaiton.animations  = [startAnimation, endAnimation, startAnimation1, endAnimation1]
//
//        pinkLayer.add(groupAnimaiton, forKey: "groupAnimaiton")
    }
    
    private func showTipString(tipString: String) -> Void {
        
        let maxWidth:CGFloat = (self.tipBackgrountView?.frame.size.width)! - 60.0;
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
        ProgressHub.shared.containerView.frame = CGRect(x: ((ProgressHub.shared.tipBackgrountView?.frame.size.width)! - containerWidth) / 2,
                                                        y: ((ProgressHub.shared.tipBackgrountView?.frame.size.height)! - containerHeight) / 2,
                                                        width: containerWidth,
                                                        height: containerHeight)
        ProgressHub.shared.tipLabel.frame = CGRect(x: (containerWidth - size.width) / 2,
                                                   y: 10.0,
                                                   width: size.width,
                                                   height: size.height)
        
        let animationTime:TimeInterval = 0.5 + 0.1 * Double(statusString.length) > 3.5 ? 3.5 : 0.5 + 0.1 * Double(statusString.length)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + animationTime) {
            
            ProgressHub.shared.tipBackgrountView?.removeFromSuperview()
        }
    }
}
