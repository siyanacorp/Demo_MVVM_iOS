//
//  BindingTextField.swift
//  Demo_MVVM_iOS
//
//  Created by Aman Kumar on 16/02/24.
//
import Combine
import Foundation
import UIKit
class BindingTextField: UITextField {
    var textChanged: PassthroughSubject<String, Never> = PassthroughSubject<String, Never>()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
    }
    
    @objc func textFieldDidChanged(_ textField: UITextField) {
        if let text = textField.text {
            textChanged.send(text)
        }
    }
}
