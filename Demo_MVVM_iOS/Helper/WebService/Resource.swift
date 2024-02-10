//
//  Resource.swift
//  Demo_MVVM_iOS
//
//  Created by Aman Kumar on 10/02/24.
//

import Foundation
/**
 Represents a resource for making network requests, including URL, HTTP method, request body, and optional headers.
 
 - url: The URL of the resource.
 - httpMethod: The HTTP method to be used for the request, defaulting to GET.
 - body: Optional data representing the request body.
 - headers: Optional HTTP headers for the request.
 */
struct Resource<T: Codable>{
    let url: String
    var httpMethod: HttpMethod = .get
    var body: Data? = nil
    var headers: [String: String]? = nil
}
