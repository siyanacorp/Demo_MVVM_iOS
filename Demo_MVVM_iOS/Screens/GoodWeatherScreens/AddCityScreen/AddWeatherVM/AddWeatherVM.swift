//
//  AddWeatherVM.swift
//  Demo_MVVM_iOS
//
//  Created by Aman Kumar on 14/02/24.
//

import Combine
import Foundation

class AddWeatherVM: ObservableObject {
    /// manager: The web service manager responsible for making network requests.
    private let manager = WebServiceManager.shared
    
    /// A published variable weatherToday of type GoodWeatherModel representing today's weather conditions.
    @Published var weatherToday: GoodWeatherModel?
    @Published var cityName: String = String()
    
    @MainActor func addWeather() {
        let weatherUrl = Constants.Urls.urlForWeatherByCity(city: self.cityName)
        
        let weatherResource: Resource<GoodWeatherModel> = {
            let urlString = weatherUrl.absoluteString
            var resource = Resource<GoodWeatherModel>(url: urlString)
            resource.httpMethod = HttpMethod.get
            resource.body = nil
            return resource
        }()
        
        GlobalLoader.shared.showLoader(title: AppText.shared.cityAddLoadingTitle)
        Task {
            do {
                let weatherToday: GoodWeatherModel = try await manager.request(resource: weatherResource)
                self.weatherToday = weatherToday
                GlobalLoader.shared.hideLoader()
            } catch let error as DataError {
                GlobalLoader.shared.hideLoader()
                switch error {
                case .invalidResponse(let toast):
                    ToastManager.shared.showToast(message: toast)
                case .invalidURL(let toast):
                    ToastManager.shared.showToast(message: toast)
                case .invalidData(let toast):
                    ToastManager.shared.showToast(message: toast)
                case .connectivityError(let toast):
                    ToastManager.shared.showToast(message: toast)
                case .network(let underlyingError):
                    if let error = underlyingError {
                        print("🛑 Network error: \(error.localizedDescription)")
                        ToastManager.shared.showToast(message: "🛑 Network error: \(error.localizedDescription)")
                        // Handle network error case
                    } else {
                        print("🛑 Network error")
                        ToastManager.shared.showToast(message: "🛑 Network error")
                        // Handle generic network error case
                    }
                }
            } catch {
                GlobalLoader.shared.hideLoader()
                print("🛑 \(error)")
                print("🛑 \(error.localizedDescription)")
                ToastManager.shared.showToast(message: "🛑 \(error.localizedDescription)")
                // Handle other types of errors
            }
        }
    }
}

extension AddWeatherVM {
    /// A weatherTodayPublisher variable that emits GoodWeatherModel? updates, operating on the main dispatch queue.
    var weatherTodayPublisher: AnyPublisher<GoodWeatherModel?, Never> {
        $weatherToday
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    /// A cityNamePublisher variable that emits cityName updates, operating on the main dispatch queue.
    var cityNamePublisher: AnyPublisher<String, Never> {
        $cityName
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
