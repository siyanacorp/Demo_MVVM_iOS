//
//  SettingsTableViewCell.swift
//  Demo_MVVM_iOS
//
//  Created by Aman Kumar on 13/02/24.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    // MARK: - IBOUTLETS
    @IBOutlet weak var labelSettingName: UILabel!
    @IBOutlet weak var imageViewCheck: UIImageView!
    
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
     Configures the cell's UI based on the provided information about a unit.
     
     - Parameters:
     - info: A tuple containing information about the unit and whether it's selected.
     - unit: An optional `Unit` value representing the unit to display.
     - isSelected: A Boolean indicating whether the unit is selected.
     
     - Note: If `unit` is provided, the cell's UI is updated to display the unit's name and adjust the visibility of the checkmark image based on the `isSelected` status.
     */
    internal func configure(with info: (unit: Unit?, isSelected: Bool)?) {
        if let unit = info?.unit {
            self.imageViewCheck.isHidden = !(info?.isSelected ?? Bool())
            self.labelSettingName.text = unit.displayName
        }
    }
}
