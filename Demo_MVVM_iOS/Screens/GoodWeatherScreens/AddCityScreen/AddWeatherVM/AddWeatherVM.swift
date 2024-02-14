//
//  AddWeatherVM.swift
//  Demo_MVVM_iOS
//
//  Created by Aman Kumar on 14/02/24.
//

import Foundation

class AddWeatherVM{
    internal func addWeather(for city: String){
        let weatherUrl = Constants.Urls.urlForWeatherByCity(city: city)
        
        static var weatherResouce: Resource<[GoodWeatherModel]> = {
            let urlString = weatherUrl
            var resource = Resource<[MarvelSuperHeroModel]>(url: urlString)
            resource.httpMethod = HttpMethod.get
            resource.body = nil
            return resource
        }()
        
    }
}
