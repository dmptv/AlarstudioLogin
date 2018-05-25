//
//  NetworkLayerProtocol.swift
//  AlarstudioTest
//
//  Created by 123 on 25.05.2018.
//  Copyright © 2018 kanat. All rights reserved.
//

import Foundation

protocol NetworkLayerProtocol {
    typealias CompletionHandler = (Result) -> Void
    associatedtype StateEnum
    associatedtype ResultType
}

enum State {
    case notSearchedYet
    case loading
    case noResults
    case results
}

enum Result {
    case sucsess(Any?)
    case failure
}
