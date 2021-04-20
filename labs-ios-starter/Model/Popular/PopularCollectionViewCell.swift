//
//  PopularCollectionViewCell.swift
//  labs-ios-starter
//
//  Created by Sal562 on 4/19/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    
    //add Views/Create Custom Cell Layout
    var cityName = UILabel(text: "City", font: .systemFont(ofSize: 20))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(cityName)
        cityName.textColor = .white
        cityName.fillSuperview(padding: .init(top: 5, left: 5, bottom: 5, right: 5))
        backgroundColor = .darkGray
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
