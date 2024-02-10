//
//  MarvelSuperHeroListViewC+TableView.swift
//  Demo_MVVM_iOS
//
//  Created by Jogender Singh on 10/02/24.
//

import Foundation
import UIKit

// MARK: - TABLE VIEW DATA SOURCE
extension MarvelSuperHeroListViewC:UITableViewDataSource{
    // TODO: NUMBER OF SECTIONS IN TABLEVIEW
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.superHeroVM.numberOfSections
    }
    
    // TODO: NUMBER OF ROWS IN SECTION
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.superHeroVM.numberOfRowsInSection(section)
    }
    
    // TODO: CELL FOR ROW AT INDEXPATH
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell:MarvelSuperHeroTableViewCell = tableView.dequeueReusableCell(withIdentifier: MarvelSuperHeroTableViewCell.className, for: indexPath) as? MarvelSuperHeroTableViewCell else{
            fatalError("NO \(MarvelSuperHeroListViewC.className) found...!")
        }
        cell.configure(with: self.superHeroVM.superHeroAtIndex(indexPath.row))
        return cell
    }
}

// MARK: - TABLE VIEW DELEGATE
extension MarvelSuperHeroListViewC:UITableViewDelegate{
    
}
