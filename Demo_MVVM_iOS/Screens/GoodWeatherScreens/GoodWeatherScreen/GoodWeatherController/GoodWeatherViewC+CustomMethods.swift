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
        self.handleCombinePublishers()
    }
    
    /**
     Handles the combination of publishers in the view model to update the UI accordingly based on weather data for all cities.
     This method listens to changes in the `allCitiesWeatherPublisher` publisher and updates the UI in response to changes.
     
     - Important: This method assumes that `allCitiesWeatherPublisher` is a publisher that emits events related to changes in weather data for all cities.
     
     - Note: This method reloads the table view and adjusts the visibility of the `noDataFoundStackView` based on whether the weather list is empty or not.
     
     - Warning: Ensure proper memory management by capturing `self` weakly to avoid retain cycles.
     
     - Requires: `goodWeatherListVM` to be properly initialized and configured with appropriate publishers.
     */
    private func handleCombinePublishers() {
        self.goodWeatherListVM.allCitiesWeatherPublisher
            .sink { [weak self] _ in
                // Handle changes to the superHeros array here
                // Update UI or perform any other actions
                guard let self = self else { return }
                self.tableView.reloadData()
                self.noDataFoundStackView.isHidden = !self.goodWeatherListVM.weatherListEmpty()
            }
            .store(in: &cancellables)
    }
}
