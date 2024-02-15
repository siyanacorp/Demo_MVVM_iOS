//
//  SettingsVM.swift
//  Demo_MVVM_iOS
//
//  Created by Jogender Singh on 15/02/24.
//

import Foundation

enum Unit: String, CaseIterable{
    case celcius = "metric"
    case fahrenheit = "imperial"
}

extension Unit {
    var displayName:String{
        get {
            switch(self){
            case .celcius :
                return "Celcius"
                
            case .fahrenheit :
                return "Fahrenheit"
            }
        }
    }
}


class SettingsVM {
    let units = Unit.allCases
}
