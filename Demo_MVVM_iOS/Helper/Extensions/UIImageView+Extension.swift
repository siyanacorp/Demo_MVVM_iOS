//
//  UIImageView+Extension.swift
//  Demo_MVVM_iOS
//
//  Created by Aman Kumar on 10/02/24.
//

import Foundation
import UIKit


private var overlayColorKey: UInt8 = 0
private var gradientStartColorKey: UInt8 = 0
private var gradientEndColorKey: UInt8 = 0
extension UIImageView {
    @IBInspectable var overlayColor: UIColor? {
        get {
            return objc_getAssociatedObject(self, &overlayColorKey) as? UIColor
        }
        set {
            objc_setAssociatedObject(self, &overlayColorKey, newValue, .OBJC_ASSOCIATION_RETAIN)
            addOverlay()
        }
    }
    
    @IBInspectable var gradientStartColor: UIColor? {
        get {
            return objc_getAssociatedObject(self, &gradientStartColorKey) as? UIColor
        }
        set {
            objc_setAssociatedObject(self, &gradientStartColorKey, newValue, .OBJC_ASSOCIATION_RETAIN)
            addGradientLayer()
        }
    }
    
    @IBInspectable var gradientEndColor: UIColor? {
        get {
            return objc_getAssociatedObject(self, &gradientEndColorKey) as? UIColor
        }
        set {
            objc_setAssociatedObject(self, &gradientEndColorKey, newValue, .OBJC_ASSOCIATION_RETAIN)
            addGradientLayer()
        }
    }
    
    
    private struct AssociatedKeys {
        static var overlayColor = "overlayColor"
        static var gradientStartColor = "gradientStartColor"
        static var gradientEndColor = "gradientEndColor"
        static var gradientStartPercentage = "gradientStartPercentage"
        static var gradientEndPercentage = "gradientEndPercentage"
    }
    
    @IBInspectable var gradientStartPercentage: CGFloat {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.gradientStartPercentage) as? CGFloat ?? 0.7
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.gradientStartPercentage, newValue, .OBJC_ASSOCIATION_RETAIN)
            addGradientLayer()
        }
    }
    
    @IBInspectable var gradientEndPercentage: CGFloat {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.gradientEndPercentage) as? CGFloat ?? 0.3
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.gradientEndPercentage, newValue, .OBJC_ASSOCIATION_RETAIN)
            addGradientLayer()
        }
    }
    
    private func addOverlay() {
        if let color = overlayColor {
            let overlay = UIView(frame: bounds)
            overlay.backgroundColor = color.withAlphaComponent(0.5)
            overlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            overlay.tag = 999 // You can use a different unique tag
            addSubview(overlay)
            bringSubviewToFront(overlay)
        } else {
            removeOverlay()
        }
    }
    
    private func removeOverlay() {
        if let overlay = viewWithTag(999) {
            overlay.removeFromSuperview()
        }
    }
    
    private func addGradientLayer() {
        // Remove existing gradient layer
        layer.sublayers?.filter { $0 is CAGradientLayer }.forEach { $0.removeFromSuperlayer() }
        
        // Add gradient layer if both start and end colors are provided
        if let startColor = gradientStartColor, let endColor = gradientEndColor {
            let gradientLayer = CAGradientLayer()
            
            // Calculate heights based on percentages
            let totalHeight = bounds.height
            let startHeight = totalHeight * gradientStartPercentage
            let endHeight = totalHeight - startHeight
            
            gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
            gradientLayer.frame = bounds
            gradientLayer.cornerRadius = layer.cornerRadius
            
            // Apply heights to gradient layer
            gradientLayer.locations = [0.0, NSNumber(value: Float(endHeight / totalHeight))]
            
            layer.insertSublayer(gradientLayer, at: 0)
        }
    }
}
