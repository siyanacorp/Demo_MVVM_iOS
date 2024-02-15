//
//  SettingsVM.swift
//  Demo_MVVM_iOS
//
//  Created by Jogender Singh on 15/02/24.
//

import Combine
import Foundation

enum Unit: String, CaseIterable {
    case celcius = "metric"
    case fahrenheit = "imperial"
}

extension Unit {
    var displayName: String {
        switch(self) {
        case .celcius:
            return "Celcius"
        case .fahrenheit:
            return "Fahrenheit"
        }
    }
}

class SettingsVM {
    let units = Unit.allCases
    private let selectedUnitKey = "selectedUnit"
    private let defaultUnit: Unit = .celcius
    
    private lazy var selectedUnitSubject: CurrentValueSubject<Unit, Never> = {
        return CurrentValueSubject<Unit, Never>(selectedUnit)
    }()
    
    var selectedUnit: Unit {
        get {
            if let savedUnit = UserDefaults.standard.string(forKey: selectedUnitKey),
               let unit = Unit(rawValue: savedUnit) {
                return unit
            }
            return defaultUnit
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: selectedUnitKey)
            selectedUnitSubject.send(newValue)
        }
    }
    
    // Expose a publisher for the selected unit
    var selectedUnitPublisher: AnyPublisher<Unit, Never> {
        return selectedUnitSubject.eraseToAnyPublisher()
    }
}

extension SettingsVM {
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return units.count
    }
    
    func settingAtIndex(_ index: Int) -> (unit: Unit, isSelected: Bool)? {
        guard index < units.count else {
            return nil
        }
        let unit = units[index]
        let isSelected = unit == selectedUnit
        return (unit, isSelected)
    }
    
    func settingListEmpty() -> Bool {
        return units.isEmpty
    }
}
