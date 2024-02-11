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
        self.tableView.registerNibCell(MarvelSuperHeroTableViewCell.self, fromNibWithName: MarvelSuperHeroTableViewCell.className)
        
        if #available(iOS 10.0, *) {
            self.tableView.refreshControl = self.refreshControl
        } else {
            self.tableView.addSubview(self.refreshControl)
        }
        
        // Configure the refresh control
        self.refreshControl.addTarget(self, action: #selector(self.refreshData(_:)), for: .valueChanged)
        self.refreshControl.tintColor = UIColor.gray
        
        // Call fetchSuperHeros to initiate the network request
        self.superHeroVM.fetchSuperHeros()
        
        self.superHeroVM.superHerosPublisher
            .sink { [weak self] _ in
                // Handle changes to the superHeros array here
                // Update UI or perform any other actions
                guard let self = self else { return }
                self.tableView.reloadData()
            }
            .store(in: &cancellables)
    }
}
