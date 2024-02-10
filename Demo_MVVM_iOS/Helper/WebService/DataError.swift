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
enum DataError: Error{
    case invalidResponse
    case invalidURL
    case invalidData
    case connectivityError
    case network(Error?)
}
