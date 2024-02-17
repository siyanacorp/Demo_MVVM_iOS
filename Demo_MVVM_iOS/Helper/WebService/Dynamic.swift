//
//  Dynamic.swift
//  Demo_MVVM_iOS
//
//  Created by Aman Kumar on 17/02/24.
//

import Combine
import Foundation
class Dynamic<T> {
    var value: T {
        didSet {
            publisher.send(value)
        }
    }

    private let publisher: CurrentValueSubject<T, Never>

    var publisherValue: AnyPublisher<T, Never> {
        return publisher.eraseToAnyPublisher()
    }

    init(_ value: T) {
        self.value = value
        self.publisher = CurrentValueSubject<T, Never>(value)
    }
}
