//
//  GoodWeatherViewC+CustomMethods.swift
//  Demo_MVVM_iOS
//
//  Created by Jogender Singh on 12/02/24.
//

import Foundation
import UIKit
/// Contains custom methods specific to the GoodWeatherViewC class.
extension GoodWeatherViewC {
    // TODO: INITIAL SETUP
    /**
     Performs initial setup for the class.
     */
    internal func initialSetup() {
        self.tableView.registerNibCell(GoodWeatherTableViewCell.self, fromNibWithName: GoodWeatherTableViewCell.className)
    }
}
