//
//  UITextField+Extension.swift
//  Demo_MVVM_iOS
//
//  Created by Aman Kumar on 03/03/24.
//

import Foundation
import UIKit
// TODO: For maximum character length
private var maxLengths = [UITextField: Int]()
extension UITextField {
    @IBInspectable var maxLength: Int {
        get {
            guard let len = maxLengths[self] else {
                return 150 // (global default-limit. or just, Int.max)
            }
            return len
        }
        set {
            maxLengths[self] = newValue
            addTarget(self, action: #selector(fix), for: .editingChanged)
        }
    }
    @objc func fix(textField: UITextField) {
        if let tex = textField.text {
            textField.text = String(tex.prefix(maxLength))
        }
    }
}


// TODO: FOR SETTING IMAGE
extension UITextField {
    // MARK: - Image
    @IBInspectable var icon: UIImage? {
        get {
            if let iconView = leftView as? UIImageView {
                return iconView.image
            }
            return nil
        }
        set {
            if let image = newValue {
                let iconView = UIImageView(frame: CGRect(x: 10, y: 5, width: 20, height: 20))
                iconView.image = image
                let iconContainerView = UIView(frame: CGRect(x: 20, y: 0, width: 30, height: 30))
                iconContainerView.addSubview(iconView)
                leftView = iconContainerView
                leftViewMode = .always
            } else {
                leftView = nil
                leftViewMode = .never
            }
        }
    }
    
    // MARK: - Padding
    enum PaddingSide {
        case left(CGFloat)
        case right(CGFloat)
        case both(CGFloat)
    }
    
    @IBInspectable var padding: CGFloat {
        get {
            return 0.0
        }
        set {
            addPadding(.both(newValue))
        }
    }
    
    func addPadding(_ padding: PaddingSide) {
        self.leftViewMode = .always
        self.layer.masksToBounds = true
        
        switch padding {
        case .left(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            self.leftView = paddingView
            self.rightViewMode = .always
            
        case .right(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            self.rightView = paddingView
            self.rightViewMode = .always
            
        case .both(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            // left
            self.leftView = paddingView
            self.leftViewMode = .always
            // right
            self.rightView = paddingView
            self.rightViewMode = .always
        }
    }
}
