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
     Sets up the user interface for the settings screen.
     
     - Returns: None.
     */
    internal func setupUIForSettings(){
        self.labelCityTemp.isHidden = true
    }
    
    
}
