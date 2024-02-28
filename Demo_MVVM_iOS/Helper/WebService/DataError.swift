//
//  DataError.swift
//  Demo_MVVM_iOS
//
//  Created by Aman Kumar on 10/02/24.
//

import Foundation

/**
 Defines various types of data-related errors that can occur during data processing.
 
 - invalidResponse: Represents an invalid response from a data source.
 - invalidURL: Indicates an invalid URL.
 - invalidData: Denotes invalid or corrupted data.
 - network: Signifies a network-related error, optionally encapsulating an underlying error.
 */
enum DataError: Error {
    case invalidResponse(toast: String)
    case invalidURL(toast: String)
    case invalidData(toast: String)
    case connectivityError(toast: String)
    case network(Error?)
}


extension DataError: Equatable {
    public static func == (lhs: DataError, rhs: DataError) -> Bool {
        switch (lhs, rhs) {
        case (.invalidResponse(let lhsToast), .invalidResponse(let rhsToast)):
            return lhsToast == rhsToast
        case (.invalidURL(let lhsToast), .invalidURL(let rhsToast)):
            return lhsToast == rhsToast
        case (.invalidData(let lhsToast), .invalidData(let rhsToast)):
            return lhsToast == rhsToast
        case (.connectivityError(let lhsToast), .connectivityError(let rhsToast)):
            return lhsToast == rhsToast
        case (.network, .network):
            return true
        default:
            return false
        }
    }
}
