//
//  HttpMethod.swift
//  Demo_MVVM_iOS
//
//  Created by Aman Kumar on 10/02/24.
//

import Foundation
/**
 Enumerates different HTTP methods along with their corresponding string representations.
 
 - get: Represents the GET HTTP method.
 - post: Represents the POST HTTP method.
 - put: Represents the PUT HTTP method.
 - patch: Represents the PATCH HTTP method.
 - delete: Represents the DELETE HTTP method.
 - head: Represents the HEAD HTTP method.
 - options: Represents the OPTIONS HTTP method.
 */
enum HttpMethod: String{
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
    case head = "HEAD"
    case options = "OPTIONS"
}
