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

/// Information to display a city's walkability score
struct Walkability: Codable {
    let walkability: Int
}


// MARK: - City Data
struct City: Codable {
    let city, state: String?
}

struct CityData : Codable {
    let airQualityIndex : String?
    let city : City
    let crime : String?
    let diversityIndex : Int?
    let latitude : Float?
    let livability : Int?
    let longitude : Float?
    let population : Int?
    let rentalPrice : Int?
    let walkability : Int?
    
    enum CodingKeys: String, CodingKey {
        case airQualityIndex = "air_quality_index"
        case city
        case crime = "crime"
        case diversityIndex = "diversity_index"
        case latitude = "latitude"
        case livability = "livability"
        case longitude = "longitude"
        case population = "population"
        case rentalPrice = "rental_price"
        case walkability = "walkability"
    }
    
}

/// TODO: other decodable data to use
//Add Weather API Endpoint
//Add Employment Opps Endpoint
//Add livability Endpoint
