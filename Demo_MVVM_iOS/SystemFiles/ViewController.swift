//
//  ViewController.swift
//  Demo_MVVM_iOS
//
//  Created by Jogender Singh on 07/02/24.
//

import UIKit
///  class  defining the behavior and presentation of a specific part of the app's user interface and logic, making it a fundamental building block in iOS application development.
class ViewController: UIViewController {
    // MARK: - IBOUTLETS
    
    // MARK: - PROPERTIES
    // MARK: - VIEW LIFE CYCLE METHODS
    // TODO: VIEW DID LOAD METHOD
    override func viewDidLoad() {
        super.viewDidLoad()
        
      /*  let button = UIButton(type: .roundedRect)
             button.frame = CGRect(x: 20, y: 50, width: 100, height: 30)
             button.setTitle("Test Crash", for: [])
             button.addTarget(self, action: #selector(self.crashButtonTapped(_:)), for: .touchUpInside)
             view.addSubview(button) */
    }
    
    // TODO: DEINIT
    deinit {
        print("ViewController has been DEINIT...!")
    }
    // MARK: - ACTIONS
    /* @IBAction func crashButtonTapped(_ sender: AnyObject) {
         let numbers = [0]
         let _ = numbers[1]
     } */
}
