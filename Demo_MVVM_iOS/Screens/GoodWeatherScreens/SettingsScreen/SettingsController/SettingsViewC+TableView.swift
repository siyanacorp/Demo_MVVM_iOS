//
//  SettingsViewC+TableView.swift
//  Demo_MVVM_iOS
//
//  Created by Jogender Singh on 13/02/24.
//

import Foundation
import UIKit
// MARK: - TABLE VIEW DATA SOURCE
extension SettingsViewC: UITableViewDataSource {
    // TODO: NUMBER OF SECTIONS IN TABLEVIEW
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // TODO: NUMBER OF ROWS IN SECTION
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.settingsVM.units.count
    }
    
    // TODO: CELL FOR ROW AT INDEXPATH
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: SettingsTableViewCell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.className, for: indexPath) as? SettingsTableViewCell else {
            fatalError("NO \(SettingsTableViewCell.className) found...!")
        }
        
        cell.configure(with: self.settingsVM.units[indexPath.row])
        return cell
    }
}

// MARK: - TABLE VIEW DELEGATE
extension SettingsViewC: UITableViewDelegate {
    // TODO: DID SELECT ROW AT INDEXPATH
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
