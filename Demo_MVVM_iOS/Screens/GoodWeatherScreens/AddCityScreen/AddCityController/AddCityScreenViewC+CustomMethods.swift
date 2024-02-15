//
//  AddCityScreenViewC+UITextFieldDelegate.swift
//  Demo_MVVM_iOS
//
//  Created by Jogender Singh on 12/02/24.
//

import Foundation
import UIKit
/// Contains custom methods specific to the AddCityScreenViewC class.
extension AddCityScreenViewC {
    /**
     Performs initial setup for the class.
     */
    internal func initialSetup() {
        self.handleCombinePublishers()
    }
    
    /**
     Handles the combination of publishers in the view model to update the UI and perform actions accordingly for adding weather data.
     
     This method listens to changes in the `cityNamePublisher` and `weatherTodayPublisher` publishers from the `addWeatherVM` view model and updates the UI or performs actions based on the received data.
     
     - Note: The `cityNamePublisher` emits events related to changes in the city name input field, while the `weatherTodayPublisher` emits events related to the weather forecast for today.
     
     - Important: Ensure proper memory management by capturing `self` weakly to avoid retain cycles.
     
     - Requires: `addWeatherVM` to be properly initialized and configured with appropriate publishers.
     
     - Parameters:
     - `buttonSaveRef`: Reference to the save button in the UI.
     - `callBackSendWeather`: A closure to send today's weather data once available.
     */
    private func handleCombinePublishers() {
        self.addWeatherVM.cityNamePublisher
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.buttonSaveRef.isEnabled = !self.addWeatherVM.cityName.isEmpty
                self.buttonSaveRef.backgroundColor = self.addWeatherVM.cityName.isEmpty ? .lightGray : .blue
                self.buttonSaveRef.setTitleColor(.white, for: .normal)
            }
            .store(in: &cancellables)
        
        self.addWeatherVM.weatherTodayPublisher
            .sink { [weak self] _ in
                guard let self = self else { return }
                if let weather = self.addWeatherVM.weatherToday {
                    self.callBackSendWeather?(weather)
                    self.dismiss(animated: true)
                }
            }
            .store(in: &cancellables)
    }
}
