//
//  GoodWeatherTableViewCell.swift
//  Demo_MVVM_iOS
//
//  Created by Jogender Singh on 13/02/24.
//

import UIKit

class GoodWeatherTableViewCell: UITableViewCell {
    // MARK: - IBOUTLETS
    @IBOutlet weak var labelCityName: UILabel!
    @IBOutlet weak var labelCityTemp: UILabel!
    
    // MARK: - PROPERTIES
    
    // MARK: - VIEW LIFE CYCLE METHODS
    // TODO: AWAKE FROM NIB
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // TODO: SET SELECTED
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    /**
     Configures the view with information from a GoodWeatherVM instance.
     
     This method updates the UI elements of the view with the information provided by the GoodWeatherVM instance.
     
     - Parameters:
     - info: An instance of GoodWeatherVM containing weather information.
     
     - Important: This method assumes that the provided `info` object is not nil.
     
     - Note: The method updates the text of the labelCityName with the name of the city and the labelCityTemp with the temperature in Celsius.
     
     - Warning: Ensure that the `info` object is properly initialized before calling this method to prevent unexpected behavior.
     
     - Requires: The view must have outlets connected to labelCityName and labelCityTemp for the updates to reflect properly on the UI.
     */
    internal func configure(with info: GoodWeatherVM?) {
        if let info = info {
            self.labelCityName.text = info.name
            
            if let savedUnit = UserDefaults.standard.string(forKey: "selectedUnit"),
               let unit = Unit(rawValue: savedUnit) {
                switch unit {
                case .celcius:
                    self.labelCityTemp.text = "\(info.tempC)° C"
                case .fahrenheit:
                    self.labelCityTemp.text = "\(info.tempF)° F"
                }
            }
        }
    }
}
