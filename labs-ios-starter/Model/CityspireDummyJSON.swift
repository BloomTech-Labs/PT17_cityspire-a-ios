//
//  CityspireDummyJSON.swift
//  labs-ios-starter
//
//  Created by Sal562 on 4/14/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import Foundation

// MARK: - Review
struct PopularRoot : Codable {
    
    let popular : [Popular]?

        enum CodingKeys: String, CodingKey {
            case popular = "popular"
        }
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            popular = try values.decodeIfPresent([Popular].self, forKey: .popular)
        }
}

struct Popular : Codable {

    let city : String
    let imageUrl : String
    let latitude : Float
    let longitude : Float
    let state : String
    let rentalPrice: Int
    let crime : String
    let airQuality : String
    let population : Int
    let diversityIndex: Int
    let walkability : Int
    let livability : Int
    


    enum CodingKeys: String, CodingKey {
        case city = "city"
        case imageUrl = "imageUrl"
        case latitude = "latitude"
        case longitude = "longitude"
        case state = "state"
        case rentalPrice = "rental_price"
        case crime
        case airQuality = "air_quality_index"
        case population
        case diversityIndex = "diversity_index"
        case walkability
        case livability
        
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        city = try values.decodeIfPresent(String.self, forKey: .city)!
        imageUrl = try values.decodeIfPresent(String.self, forKey: .imageUrl)!
        latitude = try values.decodeIfPresent(Float.self, forKey: .latitude)!
        longitude = try values.decodeIfPresent(Float.self, forKey: .longitude)!
        state = try values.decodeIfPresent(String.self, forKey: .state)!
        rentalPrice = try values.decodeIfPresent(Int.self, forKey: .rentalPrice)!
        crime = try values.decodeIfPresent(String.self, forKey: .crime)!
        airQuality = try values.decodeIfPresent(String.self, forKey: .airQuality)!
        population = try values.decodeIfPresent(Int.self, forKey: .population)!
        diversityIndex = try values.decodeIfPresent(Int.self, forKey: .diversityIndex)!
        walkability = try values.decodeIfPresent(Int.self, forKey: .walkability)!
        livability = try values.decodeIfPresent(Int.self, forKey: .livability)!
    }
}


let CityspireDummyJSON = """
{
  "city": {
    "city": "Denver",
    "state": "CO"
  },
  "latitude": 39.840562,
  "longitude": -105.007985,
  "rental_price": 1750,
  "crime": "High",
  "air_quality_index": "Moderate",
  "population": 728941,
  "diversity_index": 59,
  "walkability": 61,
  "livability": 55,
  "recommendations": [
    {
      "city": "Austin",
      "state": "TX"
    },
    {
      "city": "Bakersfield",
      "state": "CA"
    },
    {
      "city": "Grand Junction",
      "state": "CO"
    },
    {
      "city": "Scranton",
      "state": "PA"
    },
    {
      "city": "Sheboygan",
      "state": "WI"
    }
  ]
}
""".data(using: .utf8)!


let favoritesData = """
{
  "favorites": [
    {
      "city": "Seattle",
      "state": "WA",
      "latitude": 47.598457541981766,
      "longitude": -122.28600702714175,
      "imageUrl": "https://www.pexels.com/photo/aerial-view-of-city-buildings-3964406/"
        
    },
    {
      "city": "Austin",
      "state": "TX",
      "latitude": 30.30799450600118,
      "longitude": -97.74993596132845,
      "imageUrl": "https://www.pexels.com/photo/america-architecture-austin-austin-texas-273204/"
    },
    {
      "city": "New York",
      "state": "NY",
      "latitude": 40.70728095173828,
      "longitude": -74.02256537228823,
      "imageUrl": "https://www.pexels.com/photo/monochrome-photo-of-city-3889865/"
    },
    {
      "city": "Boston",
      "state": "MA",
      "latitude": 42.3243932353924,
      "longitude": -71.01447454188019,
      "imageUrl": "https://www.pexels.com/photo/city-red-street-iphone-4393610/"
    }
  ]
}
""".data(using: .utf8)!

