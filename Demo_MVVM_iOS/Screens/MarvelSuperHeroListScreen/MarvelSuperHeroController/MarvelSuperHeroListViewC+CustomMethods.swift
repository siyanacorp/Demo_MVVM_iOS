//
//  MarvelSuperHeroListViewC+CustomMethods.swift
//  Demo_MVVM_iOS
//
//  Created by Aman Kumar on 10/02/24.
//

import Foundation
/// Contains custom methods specific to the MarvelSuperHeroListViewC class.
extension MarvelSuperHeroListViewC{
    
    // TODO: INITIAL SETUP
    /**
     Performs initial setup for the class.
     */
    internal func initialSetup(){
        self.tableView.registerNibCell(MarvelSuperHeroTableViewCell.self, fromNibWithName: MarvelSuperHeroTableViewCell.className)
        
        self.superHeroVM.$superHeros
            .sink { [weak self] superHeros in
                // Handle changes to the superHeros array here
                // Update UI or perform any other actions
                print("Superheroes array updated: \(superHeros?.count ?? 0) superheroes")
            }
            .store(in: &cancellables)
        
        // Call fetchSuperHeros to initiate the network request
        self.superHeroVM.fetchSuperHeros()
    }
    
}
