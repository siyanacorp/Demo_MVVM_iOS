//
//  MarvelSuperHeroListViewC.swift
//  Demo_MVVM_iOS
//
//  Created by Aman Kumar on 10/02/24.
//

import UIKit
import Combine
/// View controller for displaying Marvel characters.
class MarvelSuperHeroListViewC: UIViewController {
    // MARK: - IBOUTLETS
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - PROPERTIES
    internal var cancellables = Set<AnyCancellable>()
    internal var superHeroVM = MarvelSuperHeroListVM()
    
    // MARK: - VIEW LIFE CYCLE METHODS
    // TODO: VIEW DID LOAD METHOD
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    // TODO: DEINIT
    deinit {
        print("MarvelSuperHeroListViewC has been DEINIT...!")
    }
}
