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
        
        self.handleCombinePublishers()
    }
    
    /**
     Handles the combination of publishers in the view model to update the UI accordingly based on the selected unit changes.
     This method listens to changes in the `selectedUnitPublisher` publisher and updates the UI by reloading the table view.
     
     - Important: This method assumes that `selectedUnitPublisher` is a publisher that emits events related to changes in the selected unit in the settings view model.
     
     - Note: This method reloads the table view in response to changes in the selected unit.
     
     - Warning: Ensure proper memory management by capturing `self` weakly to avoid retain cycles.
     
     - Requires: `settingsVM` to be properly initialized and configured with appropriate publishers.
     */
    private func handleCombinePublishers() {
        settingsVM.selectedUnitPublisher
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.tableView.reloadData()
            }
            .store(in: &cancellables)
    }
}
