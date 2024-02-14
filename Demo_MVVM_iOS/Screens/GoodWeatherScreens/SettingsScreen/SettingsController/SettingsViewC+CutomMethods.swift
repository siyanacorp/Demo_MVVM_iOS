//
//  SettingsViewC+CutomMethods.swift
//  Demo_MVVM_iOS
//
//  Created by Jogender Singh on 13/02/24.
//

import Foundation
import UIKit
/// Contains custom methods specific to the SettingsViewC class.
extension SettingsViewC {
    // TODO: INITIAL SETUP
    /**
     Performs initial setup for the class.
     */
    internal func initialSetup() {
        self.tableView.registerNibCell(SettingsTableViewCell.self, fromNibWithName: SettingsTableViewCell.className)
    }
}
