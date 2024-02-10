//
//  MarvelSuperHeroTableViewCell.swift
//  Demo_MVVM_iOS
//
//  Created by Aman Kumar on 10/02/24.
//

import SDWebImage
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
    
    // TODO: LAYOUT SUBVIEWS
    override func layoutSubviews() {
        super.layoutSubviews()
        // Adjust the frame of the gradient layer here
        if let gradientLayer = self.imageViewSuperHero.layer.sublayers?.first(where: { $0 is CAGradientLayer }) as? CAGradientLayer {
            gradientLayer.frame = bounds
        }
    }
    
    /**
     Configures the view with information from a MarvelSuperHeroVM instance.
     
     - Parameters:
     - info: MarvelSuperHeroVM instance containing superhero information.
     
     This method sets up the view components based on the provided superhero information asynchronously. It loads the superhero image, sets the name, and displays the biography in plain text.
     
     Example usage:
     - Returns: None.
     */
    internal func configure(with info:MarvelSuperHeroVM?){
        if let info = info{
            self.imageViewSuperHero.sd_imageIndicator = SDWebImageActivityIndicator.gray
            self.imageViewSuperHero.sd_setImage(with: URL(string: info.imageurl), placeholderImage:  UIImage(systemName: "photo"))
            self.labelNameSuperHero.text = info.name
            
            if let plainText = info.bio.convertHTMLToPlainText() {
                self.labelBioSuperHero.text = plainText
            } else {
                self.labelBioSuperHero.text = info.bio
            }
        }
    }
}
