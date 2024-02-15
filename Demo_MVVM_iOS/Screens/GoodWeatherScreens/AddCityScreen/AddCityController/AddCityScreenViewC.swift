//
//  AddCityScreenViewC.swift
//  Demo_MVVM_iOS
//
//  Created by Jogender Singh on 12/02/24.
//

import Combine
import UIKit
/// This class represents a view controller for adding a city. It inherits from UIViewController and includes IBOutlets, properties, view life cycle methods, and actions. It has a viewDidLoad method for initial setup and a deinitializer for cleanup. Additionally, it includes a TODO comment for implementing a refresh control action.
class AddCityScreenViewC: UIViewController {
    // MARK: - IBOUTLETS
    @IBOutlet weak var textFieldCityName: UITextField!
    @IBOutlet weak var buttonSaveRef: UIButton!
    
    // MARK: - PROPERTIES
    internal var cancellables = Set<AnyCancellable>()
    internal var addWeatherVM = AddWeatherVM()
    internal var callBackSendWeather:((_ weatherItem:GoodWeatherModel?)->())?
    
    // MARK: - VIEW LIFE CYCLE METHODS
    // TODO: VIEW DID LOAD METHOD
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    // TODO: DEINIT
    deinit {
        print("AddCityScreenViewC has been DEINIT...!")
    }
    
    // MARK: - ACTIONS
    // TODO: BUTTON SAVE TAPPED
    @IBAction func buttonSave_Tapped(_ sender: UIButton) {
        self.addWeatherVM.addWeather()
    }
    
    // TODO: BUTTON CLOSE TAPPED
    @IBAction func buttonClose_Tapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
}
