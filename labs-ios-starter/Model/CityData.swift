//
//  CityData.swift
//  labs-ios-starter
//
//  Created by Sal562 on 4/14/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit
import MapKit

/// Struct to use when encoding data for api POST calls
struct PostParameters: Codable {
    var city: String?
    var state: String?
}

/// Information to display a city's walkability score
struct Walkability: Codable {
    let walkability: Int
}

/// Information to display all City Data in single object
struct City: Codable {
    var cityName: String
    var cityState: String
    var latitude: CLLocationDegrees = 0
    var longitude: CLLocationDegrees = 0
    var population: Int?
    var livability: Int?
    var walkability: Int?
    var diversityIndex: Int?
    var crime: String?
    var rentalPrice: Int?
    var airQuality: String?
    
    enum CityModelKeys: String, CodingKey {
        case latitude
        case longitude
        case rental_price
        case crime
        case air_quality_index
        case population
        case diversity_index
        case walkability
        case livability

    }
    
    init(from decoder: Decoder) throws {
        cityName = "City"
        cityState = "State"
        let container = try decoder.container(keyedBy: CityModelKeys.self)
        latitude = try container.decodeIfPresent(Double.self, forKey: .latitude) ?? 0
        longitude = try container.decodeIfPresent(Double.self, forKey: .longitude) ?? 0
        population = try container.decodeIfPresent(Int.self, forKey: .population)
        livability = try container.decodeIfPresent(Int.self, forKey: .livability)
        walkability = try container.decodeIfPresent(Int.self, forKey: .walkability)
        diversityIndex = try container.decodeIfPresent(Int.self, forKey: .diversity_index)
        crime = try container.decodeIfPresent(String.self, forKey: .crime)
        rentalPrice = try container.decodeIfPresent(Int.self, forKey: .rental_price)
        airQuality = try container.decodeIfPresent(String.self, forKey: .air_quality_index)
    }
    
    init(cityName: String, cityState: String) {
        self.cityName = cityName
        self.cityState = cityState
    }
    
}

///// TODO: other decodable data to use
////Add Weather API Endpoint
////Add Employment Opps Endpoint
////Add livability Endpoint
//

