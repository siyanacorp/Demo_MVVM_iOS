//
//  NSObject+Extension.swift
//  Demo_MVVM_iOS
//
//  Created by Aman Kumar on 10/02/24.
//

import Foundation
/// Extension to NSObject for accessing class names.
extension NSObject{
    class var className: String{
        return String(describing: self)
    }
    
    var className: String{
        return String(describing: type(of: self))
    }
}
