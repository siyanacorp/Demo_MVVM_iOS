//
//  UITableView+Extension.swift
//  Demo_MVVM_iOS
//
//  Created by Aman Kumar on 10/02/24.
//

import Foundation
import UIKit
extension UITableView {
    /// Register a UITableViewCell subclass by its class type
    func registerCell<T: UITableViewCell>(_ cellClass: T.Type) {
        let reuseIdentifier = String(describing: cellClass)
        register(cellClass, forCellReuseIdentifier: reuseIdentifier)
    }

    /// Register a UITableViewCell subclass by its nib file and bundle
    func registerNibCell<T: UITableViewCell>(_ cellClass: T.Type, fromNibWithName nibName: String, bundle: Bundle? = nil) {
        let reuseIdentifier = String(describing: cellClass)
        let nib = UINib(nibName: nibName, bundle: bundle)
        register(nib, forCellReuseIdentifier: reuseIdentifier)
    }
}
