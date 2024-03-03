//
//  MarvelSuperHeroListViewC+CustomMethods.swift
//  Demo_MVVM_iOS
//
//  Created by Aman Kumar on 10/02/24.
//

import Foundation
import UIKit
/// Contains custom methods specific to the MarvelSuperHeroListViewC class.
extension MarvelSuperHeroListViewC {
    // TODO: INITIAL SETUP
    /**
     Performs initial setup for the class.
     */
    internal func initialSetup() {
        guard let tableView = tableView else {
            return
        }
        tableView.registerNibCell(MarvelSuperHeroTableViewCell.self, fromNibWithName: MarvelSuperHeroTableViewCell.className)
        
        if #available(iOS 10.0, *) {
            tableView.refreshControl = self.refreshControl
        } else {
            tableView.addSubview(self.refreshControl)
        }
        
        // Configure the refresh control
        self.refreshControl.addTarget(self, action: #selector(self.refreshData(_:)), for: .valueChanged)
        self.refreshControl.tintColor = UIColor.gray
        
        // Call fetchSuperHeros to initiate the network request
        self.superHeroVM.fetchSuperHeros()
        self.handleCombinePublishers()
    }
    
    /**
     Handles the combination of publishers in the view model to update the UI accordingly.
     This method listens to changes in the `superHerosPublisher` publisher and performs necessary UI updates when changes occur.
     
     - Important: This method assumes that `superHerosPublisher` is a publisher that emits events related to changes in the superHeros array.
     
     - Note: This method reloads the table view and adjusts the visibility of the `noDataFoundStackView` based on whether the super hero list is empty or not.
     
     - Warning: Ensure proper memory management by capturing `self` weakly to avoid retain cycles.
     
     - Requires: `superHeroVM` to be properly initialized and configured with appropriate publishers.
     */
    internal func handleCombinePublishers() {
        self.superHeroVM.superHerosPublisher
            .sink { [weak self] _ in
                // Handle changes to the superHeros array here
                // Update UI or perform any other actions
                guard let self = self else { return }
                guard let tableView = self.tableView, let noDataFoundStackView = self.noDataFoundStackView else {
                    return
                }
                tableView.reloadData()
                noDataFoundStackView.isHidden = !self.superHeroVM.superHeroListEmpty()
            }
            .store(in: &cancellables)
    }
}
