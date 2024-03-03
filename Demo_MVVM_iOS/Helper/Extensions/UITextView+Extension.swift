//
//  UITextView+Extension.swift
//  Demo_MVVM_iOS
//
//  Created by Aman Kumar on 03/03/24.
//

import Foundation
import UIKit
private var maxLengths = [UITextView: Int]()
extension UITextView {
    @IBInspectable var maxLength: Int {
        get {
            guard let len = maxLengths[self] else {
                return Int.max // Default limit is Int.max
            }
            return len
        }
        set {
            maxLengths[self] = newValue
            NotificationCenter.default.addObserver(self, selector: #selector(fix), name: UITextView.textDidChangeNotification, object: nil)
        }
    }

    @objc func fix(notification: Notification) {
        guard let textView = notification.object as? UITextView else { return }
        if let text = textView.text, text.count > maxLength {
            textView.text = String(text.prefix(maxLength))
        }
    }
}
