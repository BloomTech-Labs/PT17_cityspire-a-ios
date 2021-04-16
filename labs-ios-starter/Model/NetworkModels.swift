//
//  NetworkModels.swift
//  labs-ios-starter
//
//  Created by Jarren Campos on 2/15/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import Foundation

/// Struct to use when encoding data for api POST calls
struct PostParams: Codable {
    let city: String
    let state: String
}

/// Information to display a city's walkability score Moved to CityData
//struct Walkability: Codable {
//    let walkability: Int
//}


