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
    let imageView = UIImageView(cornerRadius: 10)
//    var cityName = UILabel(text: "City", font: .systemFont(ofSize: 20))
    let nameLabel = UILabel(text: "Popular City Name", font: .boldSystemFont(ofSize: 30), numberOfLines: 1)
    let liveabilityLabel = UILabel(text: "Livability: 1152", font: .boldSystemFont(ofSize: 26), numberOfLines: 1)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // stackview for label
        addSubview(imageView)
        let stackView = VerticalStackView(arrangedSubviews: [nameLabel, liveabilityLabel], spacing: 2)
        liveabilityLabel.textColor = .white
        nameLabel.textColor = .white
        
        //imageview properties
        imageView.alpha = 0.85
        imageView.addSubview(stackView)
        imageView.fillSuperview()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 14
        stackView.anchor(top: nil, leading: imageView.leadingAnchor, bottom: imageView.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 20, bottom: 20, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
       
    }
    

    
}
