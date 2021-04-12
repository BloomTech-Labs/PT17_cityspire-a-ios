//
//  CityDataCellS.swift
//  labs-ios-starter
//
//  Created by Sal562 on 4/12/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit

class CityDataCellS: UICollectionViewCell {

//    "rental_price": 2263,
//    "crime": "Low",
//    "air_quality_index": "Good",
//    "population": 8379043,
//    "diversity_index": 68,
//    "walkability": 88,
//    "livability": 69,
    
    //create custom views
    let imageView = UIImageView(cornerRadius: 16)
    let populationLabel = UILabel(text: "Population", font: .systemFont(ofSize: 16))
    let livabilityLabel = UILabel(text: "Livability", font: .systemFont(ofSize: 16))
    let airQualityLabel = UILabel(text: "Air Quality", font: .systemFont(ofSize: 16))
    let walkabilityLabel = UILabel(text: "Walkability", font: .systemFont(ofSize: 16))
    let crimeLabel = UILabel(text: "Crime", font: .systemFont(ofSize: 16))
    let rentalPriceLabel = UILabel(text: "Rental Price", font: .systemFont(ofSize: 16))
    let diversityIndexLabel = UILabel(text: "Diversity", font: .systemFont(ofSize: 16))
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        let vStack = VerticalStackView(arrangedSubviews: [UIView(),populationLabel, livabilityLabel, airQualityLabel, walkabilityLabel, crimeLabel, rentalPriceLabel, diversityIndexLabel], spacing: 8)
        
        addSubview(vStack)
        vStack.alignment = .leading
        vStack.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
