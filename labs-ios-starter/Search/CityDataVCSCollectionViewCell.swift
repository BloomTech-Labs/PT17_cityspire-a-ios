//
//  CityDataVCSCollectionViewCell.swift
//  labs-ios-starter
//
//  Created by Sal562 on 4/15/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit

class CityDataVCSCollectionViewCell: UICollectionViewCell {
    
    ///Create Views
    var metricLabel = UILabel(text: "Population", font: .systemFont(ofSize: 24, weight: .semibold))
    var cityDataMetricValue = UILabel(text: "850,000", font: .systemFont(ofSize: 24, weight: .semibold))
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        metricLabel.textAlignment = .left
        metricLabel.textColor = .black
        cityDataMetricValue.textColor = .black
        let stackView = UIStackView(arrangedSubviews: [metricLabel,UIView(), cityDataMetricValue], customSpacing: 15)
        addSubview(stackView)
        stackView.centerInSuperview()
    
        // TO-DO: - TEXT ALIGNMENT INSIDE CELLS NOT WORKING FIX
//        cityDataMetricValue.textAlignment = .right
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
