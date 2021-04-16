//
//  NetworkHelpers.swift
//  labs-ios-starter
//
//  Created by Sal562 on 4/14/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit

/// Enumerate Network Errors
enum NetworkErrors: Error {
    case noDataFound
    case failedLogin
    case noTokenFound
    case tryAgain
    case failedDecoding
    case failedEncoding
    case failedResponse
    case noIdentifier
    case noResponse
    case otherError
}

extension URLSession: NetworkFetchLoader {
    func dataRequest(with request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let task = self.dataTask(with: request) { data, response, error in
            completion(data, response, error)
        }
        task.resume()
    }
}

protocol NetworkFetchLoader {
    func dataRequest(with request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void)
}


