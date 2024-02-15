//
//  GoodWeatherViewC+TableView.swift
//  Demo_MVVM_iOS
//
//  Created by Jogender Singh on 13/02/24.
//

import Foundation
import UIKit
// MARK: - TABLE VIEW DATA SOURCE
extension GoodWeatherViewC: UITableViewDataSource {
    // TODO: NUMBER OF SECTIONS IN TABLEVIEW
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.goodWeatherListVM.numberOfSections
    }
    
    // TODO: NUMBER OF ROWS IN SECTION
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.goodWeatherListVM.numberOfRowsInSection(section)
    }
    
    // TODO: CELL FOR ROW AT INDEXPATH
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: GoodWeatherTableViewCell = tableView.dequeueReusableCell(withIdentifier: GoodWeatherTableViewCell.className, for: indexPath) as? GoodWeatherTableViewCell else {
            fatalError("NO \(GoodWeatherTableViewCell.className) found...!")
        }
        cell.configure(with: self.goodWeatherListVM.weatherAtIndex(indexPath.row))
        return cell
    }
}
