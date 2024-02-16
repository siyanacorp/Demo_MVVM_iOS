//
//  ViewToViewModelViewC.swift
//  Demo_MVVM_iOS
//
//  Created by Aman Kumar on 16/02/24.
//

import Combine
import UIKit

class ViewToViewModelViewC: UIViewController {
    // MARK: - IBOUTLETS
    @IBOutlet weak var textFieldUserName: BindingTextField!
    @IBOutlet weak var textFieldPassword: BindingTextField!
    @IBOutlet weak var buttonLoginRef: UIButton!
    
    // MARK: - PROPERTIES
    internal var loginVM = LoginViewModel()
    internal var cancellables = Set<AnyCancellable>()
    
    // MARK: - VIEW LIFE CYCLE METHODS
    // TODO: VIEW DID LOAD METHOD
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    // TODO: DEINIT
    deinit {
        print("ViewToViewModelViewC has been DEINIT...!")
    }
    
    // MARK: - ACTIONS
    // TODO: BUTTON LOGIN TAPPED
    @IBAction func buttonLogin_Tapped(_ sender: UIButton) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            guard let self = self else { return }
            self.loginVM.username.value = "marydoe"
            self.loginVM.password.value = "password"
        }
    }
}
