//
//  GoodWeatherViewC.swift
//  Demo_MVVM_iOS
//
//  Created by Jogender Singh on 12/02/24.
//
import Combine
import UIKit
/// This class represents a view controller for displaying good weather conditions. It inherits from UIViewController and contains the viewDidLoad method.
class GoodWeatherViewC: UIViewController {
    // MARK: - IBOUTLETS
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noDataFoundStackView: UIStackView!
    
    // MARK: - PROPERTIES
    internal var cancellables = Set<AnyCancellable>()
    internal var goodWeatherListVM = GoodWeatherListVM()
    
    // MARK: - VIEW LIFE CYCLE METHODS
    // TODO: VIEW DID LOAD METHOD
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    // TODO: PREPARE FOR SEGUE TO SET UP THE DELEGATE
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == AddCityScreenViewC.className {
            guard let nav = segue.destination as? UINavigationController else {
                fatalError("NO UINavigationController Found...!")
            }
            
            guard let presentedVC = nav.viewControllers.first as? AddCityScreenViewC else {
                fatalError("NO AddCityScreenViewC Found...!")
            }
            
            presentedVC.callBackSendWeather = { [weak self] ( weatherItem ) in
                guard let self = self else { return }
                if let weatherItem = weatherItem {
                    let weatherItemVM = GoodWeatherVM(weatherItem)
                    self.goodWeatherListVM.addWeather(cityWeather: weatherItemVM)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        ToastManager.shared.showToast(message: AppText.shared.cityWeatherAddedToast)
                    }
                    
                }
            }
            
        } else if segue.identifier == SettingsViewC.className {
            guard let nav = segue.destination as? UINavigationController else {
                fatalError("NO UINavigationController Found...!")
            }
            
            guard let presentedVC = nav.viewControllers.first as? SettingsViewC else {
                fatalError("NO SettingsViewC Found...!")
            }
            
            presentedVC.callBackWeatherSettingChanged = { [weak self]in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    ToastManager.shared.showToast(message: AppText.shared.cityWeatherSettingChangedToast)
                }
            }
        }
    }
    
    // TODO: DEINIT
    deinit {
        print("GoodWeatherViewC has been DEINIT...!")
    }
    
    // MARK: - ACTIONS
    // TODO: REFRESH CONTROL ACTION
}
