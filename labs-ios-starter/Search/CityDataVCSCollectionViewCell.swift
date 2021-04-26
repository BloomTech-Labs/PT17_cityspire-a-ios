//
//  CityDataVCSCollectionViewCell.swift
//  labs-ios-starter
//
//  Created by Sal562 on 4/15/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit

class CityDataVCSCollectionViewCell: UICollectionViewCell {
    
    
    var emojiImage = UIImageView(image: #imageLiteral(resourceName: "search"))

    
    
    //emoji
    let emojiLabel = UILabel(text: "📢", font: .boldSystemFont(ofSize: 25))
    var metricLabel = UILabel(text: "Population", font: .systemFont(ofSize: 24, weight: .regular))
    var cityDataMetricValue = UILabel(text: "850,000", font: .systemFont(ofSize: 24, weight: .semibold))
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        metricLabel.textColor = .white
        cityDataMetricValue.textColor = .white
        emojiImage.frame = .init(x: 0, y: 0, width: 50, height: 50)
        let stackView = UIStackView(arrangedSubviews: [emojiImage, metricLabel,UIView(), cityDataMetricValue], customSpacing: 5)
   
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}

 
