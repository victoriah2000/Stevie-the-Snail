//
//  UIViewExtension.swift
//  Stevie the Snail
//
//  Created by Victoria Heric on 5/3/17.
//  Copyright © 2017 Victoria Heric. All rights reserved.
//

import UIKit

extension UIView {
    func addMotionDisplacement (xAxisAmount: CGFloat = .nan, yAxisAmount: CGFloat = .nan) {
        guard UIAccessibilityIsReduceMotionEnabled() == false, (xAxisAmount != .nan || yAxisAmount != .nan) else {
            return
        }
        
        let effectsGroup = UIMotionEffectGroup()
        effectsGroup.motionEffects = []
        if xAxisAmount != .nan {
            let horizontal = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
            horizontal.minimumRelativeValue = -xAxisAmount
            horizontal.maximumRelativeValue = xAxisAmount
            effectsGroup.motionEffects?.append(horizontal)
        }
        if yAxisAmount != .nan {
            let vertical = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
            vertical.minimumRelativeValue = -yAxisAmount
            vertical.maximumRelativeValue = yAxisAmount
            effectsGroup.motionEffects?.append(vertical)
        }
        addMotionEffect(effectsGroup)
    }

    func constrainToSuperView() {
        guard let superview = superview else {
            return
        }
        translatesAutoresizingMaskIntoConstraints = false
        let attributes: [NSLayoutAttribute] = [.top, .bottom, .leading, .trailing]
        attributes.forEach { NSLayoutConstraint(item: self, attribute: $0, relatedBy: .equal, toItem: superview, attribute: $0, multiplier: 1, constant: 0).isActive = true }
    }
}

@IBDesignable extension UIView {
    
    @IBInspectable var shadowColor: UIColor? {
        set {
            layer.shadowColor = newValue!.cgColor
        }
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor:color)
            }
            else {
                return nil
            }
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        set {
            layer.shadowOpacity = newValue
        }
        get {
            return layer.shadowOpacity
        }
    }
    
    @IBInspectable var shadowOffset: CGPoint {
        set {
            layer.shadowOffset = CGSize(width: newValue.x, height: newValue.y)
        }
        get {
            return CGPoint(x: layer.shadowOffset.width, y:layer.shadowOffset.height)
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        set {
            layer.shadowRadius = newValue
        }
        get {
            return layer.shadowRadius
        }
    }
    
}
