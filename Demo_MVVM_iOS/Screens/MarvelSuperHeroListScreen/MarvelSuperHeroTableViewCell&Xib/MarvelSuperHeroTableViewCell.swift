//
//  MarvelSuperHeroTableViewCell.swift
//  Demo_MVVM_iOS
//
//  Created by Aman Kumar on 10/02/24.
//

import UIKit

class MarvelSuperHeroTableViewCell: UITableViewCell {
    // MARK: - IBOUTLETS
    @IBOutlet weak var imageViewSuperHero: UIImageView!
    @IBOutlet weak var labelNameSuperHero: UILabel!
    @IBOutlet weak var labelBioSuperHero: UILabel!
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
    
}
