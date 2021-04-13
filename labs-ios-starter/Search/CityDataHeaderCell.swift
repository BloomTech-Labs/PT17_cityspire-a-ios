//
//  CityDataHeaderCell.swift
//  labs-ios-starter
//
//  Created by Sal562 on 4/12/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit

class CityDataHeaderCell: UICollectionViewCell {
    
    
    //setup Views
    let cityLabel = UILabel(text: "Los Angeles", font: .boldSystemFont(ofSize: 20))
    let titleLabel = UILabel(text: "Los Angeles is a sprawling Southern California", font: .systemFont(ofSize: 16))
    let imageView = UIImageView(cornerRadius: 12)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        backgroundColor = .red
        
        imageView.image = #imageLiteral(resourceName: "5")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        addSubview(imageView)
        imageView.fillSuperview()
        
        titleLabel.numberOfLines = 2
        titleLabel.adjustsFontSizeToFitWidth = true
        cityLabel.textColor = .white
        titleLabel.textColor = .white

        let vStack = VerticalStackView(arrangedSubviews: [cityLabel, titleLabel, UIView()], spacing: 6)
        imageView.addSubview(vStack)
     
        imageView.addSubview(vStack)
        vStack.anchor(top: nil, leading: imageView.leadingAnchor, bottom: imageView.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 20, bottom: 10, right: 0))
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
