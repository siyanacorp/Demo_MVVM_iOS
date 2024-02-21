//
//  GoodWeatherListVM.swift
//  Demo_MVVM_iOS
//
//  Created by Aman Kumar on 14/02/24.
//

import Combine
import Foundation

class GoodWeatherListVM: ObservableObject {
    /// allCities: An array of GoodWeatherVM objects representing the all cities weather.
    @Published var allCitiesWeather: [GoodWeatherVM] = []
    
    /**
     Adds weather data for a city to the array of all cities' weather information.
     
     - Parameters:
     - cityWeather: The `GoodWeatherVM` object containing weather data for a city.
     */
    func addWeather(cityWeather: GoodWeatherVM) {
        self.allCitiesWeather.append(cityWeather)
    }
}

extension GoodWeatherListVM {
    /// allCitiesWeather is a publisher that emits an optional array of GoodWeatherModel instances or never fails. It receives updates from the weather property, dispatches events on the main thread, and erases its type to AnyPublisher.
    var allCitiesWeatherPublisher: AnyPublisher<[GoodWeatherVM], Never> {
        $allCitiesWeather
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

extension GoodWeatherListVM {
    /// Returns the number of sections in the list of all cities weather, which is always 1.
    var numberOfSections: Int {
        return 1
    }
    
    /**
     Returns the number of rows in the specified section of the list of all cities weather, which is equal to the count of weather models in the array.
     
     - Parameter section: The section index for which the number of rows is requested.
     - Returns: The number of rows in the specified section.
     */
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.allCitiesWeather.count
    }
    
    /**
     Retrieves the view model for the Marvel weather at the specified index in the list.
     
     - Parameter index: The index of the weather in the list.
     - Returns: The view model representing the weather at the specified index.
     */
    func weatherAtIndex(_ index: Int) -> GoodWeatherVM? {
        return self.allCitiesWeather[index]
    }
    
    /**
     Checks if the list of weatheres is empty.
     - Returns: A boolean value indicating whether the list of weatheres is empty or not.
     */
    func weatherListEmpty() -> Bool {
        return self.allCitiesWeather.isEmpty
    }
}

/// ViewModel for a Weather providing access to various properties like name, temperature in celsius and temperature in fahrenheit etc.
struct GoodWeatherVM {
    let weather: GoodWeatherModel
}

extension GoodWeatherVM {
    /**
     Initializes the GoodWeatherVM with a GoodWeatherModel instance.
     
     - Parameter weather: The GoodWeatherModel instance to be encapsulated by the view model.
     */
    init(_ weather: GoodWeatherModel) {
        self.weather = weather
    }
}

extension GoodWeatherVM {
    var name: String {
        return self.weather.location?.name ?? String()
    }
    
    var tempC: String {
        return "\(self.weather.current?.tempC ?? Double())"
    }
    
    var tempF: String {
        return "\(self.weather.current?.tempF ?? Double())"
    }
}
