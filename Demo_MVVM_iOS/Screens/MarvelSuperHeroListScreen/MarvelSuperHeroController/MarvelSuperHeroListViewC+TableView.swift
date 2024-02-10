//
//  MarvelSuperHeroListViewC+TableView.swift
//  Demo_MVVM_iOS
//
//  Created by Jogender Singh on 10/02/24.
//

import Foundation
import UIKit

extension MarvelSuperHeroListViewC:UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return self.superHeroVM.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.superHeroVM.numberOfRowsInSection(section))
        return self.superHeroVM.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell:MarvelSuperHeroTableViewCell = tableView.dequeueReusableCell(withIdentifier: MarvelSuperHeroTableViewCell.className, for: indexPath) as? MarvelSuperHeroTableViewCell else{
            fatalError("NO \(MarvelSuperHeroListViewC.className) found...!")
        }
        print(self.superHeroVM.superHeroAtIndex(indexPath.row)?.name)
        cell.configure(with: self.superHeroVM.superHeroAtIndex(indexPath.row))
        return cell
    }
    
    
}

extension MarvelSuperHeroListViewC:UITableViewDelegate{
    
}
