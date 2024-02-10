//
//  WebServiceManager.swift
//  Demo_MVVM_iOS
//
//  Created by Aman Kumar on 10/02/24.
//

import Foundation
///  Singleton instance managing web service interactions.
final class WebServiceManager{
    
    /// Singleton instance of WebServiceManager.
    static let shared: WebServiceManager = WebServiceManager()
    
    /**
     Initialization Method
     * private init(){} is a concise notation that prevents instances of a class from being created outside the class itself, often used in singleton patterns for centralized control. */
    private init(){}
    
    /**
     Handles an asynchronous request to a specified URL, decoding the response into a specified type.
     
     - Parameters:
     - resource: The resource object containing URL, HTTP method, optional request body, and optional headers.
     - Returns: The decoded response of type T.
     - Throws: An error if the request fails or decoding the response encounters an issue.
     */
    internal func request<T: Decodable>(resource: Resource<T>) async throws -> T {
        
        if Reachability.shared.checkInternetConnectivity(){
            print(AppText.shared.connectivityErrorMessage)
            throw DataError.connectivityError(toast: AppText.shared.connectivityErrorToast)
        }
        print(AppText.shared.connectivityPassMessage)
        
        guard let url = URL(string: resource.url) else {
            print(AppText.shared.invalidURLMessage)
            throw DataError.invalidURL(toast: AppText.shared.invalidURLToast)
        }
        print(AppText.shared.passURLMessage)
        
        var request = URLRequest(url: url)
        request.httpMethod = resource.httpMethod.rawValue
        request.httpBody = resource.body
        
        // Set headers if provided
        if let headers = resource.headers {
            for (key, value) in headers {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            print(AppText.shared.invalidResponseMessage)
            throw DataError.invalidResponse(toast: AppText.shared.invalidResponseToast)
        }
        print(AppText.shared.passResponseMessage)
        
        return try JSONDecoder().decode(T.self, from: data)
    }
}
