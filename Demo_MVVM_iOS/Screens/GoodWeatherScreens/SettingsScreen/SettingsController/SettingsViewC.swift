//
//  SettingsViewC.swift
//  Demo_MVVM_iOS
//
//  Created by Jogender Singh on 13/02/24.
//

import UIKit
/// SettingsViewC is a UIViewController subclass representing a settings view. It contains outlets for a table view and a stack view for displaying no data found message. The class implements the viewDidLoad method for initial setup and includes a deinitializer to handle cleanup.
class SettingsViewC: UIViewController {
    // MARK: - IBOUTLETS
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noDataFoundStackView: UIStackView!
    
    // MARK: - PROPERTIES
    // MARK: - VIEW LIFE CYCLE METHODS
    // TODO: VIEW DID LOAD METHOD
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    // TODO: DEINIT
    deinit {
        print("GoodWeatherViewC has been DEINIT...!")
    }
    
    // MARK: - ACTIONS
    // TODO: BUTTON DONE TAPPED
    @IBAction func buttonDone_Tapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
