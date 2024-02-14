//
//  Constants.swift
//  Demo_MVVM_iOS
//
//  Created by Aman Kumar on 14/02/24.
//

import Foundation
/// A nested structure Constants containing url structure with a method urlForWeatherByCity(city:) which generates a URL for retrieving weather data from the OpenWeatherMap API based on the provided city name.
struct Constants{
    struct Urls {
        /**
         Returns the URL for weather data based on the specified city.
         - Parameter city: The name of the city for which weather data is requested.
         - Returns: A URL object pointing to the OpenWeatherMap API endpoint for retrieving weather data for the specified city.
         */
        static func urlForWeatherByCity(city: String) -> URL {
            return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&appid= 25a83bfee509af3da6227ecf7e3b0ef6&units=imperial")!
        }
    }
}
