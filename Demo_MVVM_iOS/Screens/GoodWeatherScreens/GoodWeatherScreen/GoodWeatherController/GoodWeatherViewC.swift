//
//  GoodWeatherViewC.swift
//  Demo_MVVM_iOS
//
//  Created by Jogender Singh on 12/02/24.
//

import UIKit
/// This class represents a view controller for displaying good weather conditions. It inherits from UIViewController and contains the viewDidLoad method.
class GoodWeatherViewC: UIViewController {
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
    // TODO: REFRESH CONTROL ACTION
}
