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
    var highPerformingSchools: Int?
    var transitscore: Int?
    var bikescore: Int?
    
//    "percent_high_performing_schools": 12,
//    "transitscore": 84,
//    "bikescore": 70,
    
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
        case transitscore
        case percent_high_performing_schools
        case bikescore

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
        transitscore = try container.decodeIfPresent(Int.self, forKey: .transitscore)
        highPerformingSchools = try container.decodeIfPresent(Int.self, forKey: .percent_high_performing_schools)
        bikescore = try container.decodeIfPresent(Int.self, forKey: .bikescore)
        
    }
    
    init(cityName: String, cityState: String) {
        self.cityName = cityName
        self.cityState = cityState
    }
    
}

struct Weather: Codable {
    let description, highToday: String
    let lowToday, humidity, windSpeed, feelsLike: String
    let pressure: String
    let temperature : String

    enum CodingKeys: String, CodingKey {
        case description = "Description"
        case temperature = "Temperature"
        case highToday = "High Today"
        case lowToday = "Low Today"
        case humidity = "Humidity"
        case windSpeed = "Wind Speed"
        case feelsLike = "Feels Like"
        case pressure = "Pressure"
    }
}
 
    



///// TODO: other decodable data to use
////Add Weather API Endpoint
////Add Employment Opps Endpoint
////Add livability Endpoint
//

