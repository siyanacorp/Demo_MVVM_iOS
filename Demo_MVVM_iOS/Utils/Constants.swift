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
            return URL(string: "https://api.weatherapi.com/v1/current.json?key=5d3cfb71ae184507b3144628231407&q=\(city.escaped())&aqi=no")!
        }
    }
}
