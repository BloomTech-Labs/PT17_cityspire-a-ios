//
//  FavCellS.swift
//  labs-ios-starter
//
//  Created by Sal562 on 4/11/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit


class FavCellS: UICollectionViewCell {
    
    let imageView = UIImageView(cornerRadius: 10)
    
    //ADDVIEWS
//    let appiconImageView = UIImageView(cornerRadius: 16)
    let nameLabel = UILabel(text: "Popular City Name", font: .boldSystemFont(ofSize: 30), numberOfLines: 1)
//    let descriptionLabel = UILabel(text: "Information about the City....", font: .systemFont(ofSize: 12, weight: .light) )
    
//    let whatsNewLabel = UILabel(text: "Whats New", font: .boldSystemFont(ofSize: 18))
//    let releaseNotesLabel = UILabel(text: "1.08 release notes", font: .systemFont(ofSize: 18), numberOfLines: 0)
    let liveabilityLabel = UILabel(text: "Livability: 1152", font: .boldSystemFont(ofSize: 26), numberOfLines: 1)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
  
        addSubview(imageView)
        imageView.alpha = 0.85
        imageView.addSubview(nameLabel)
        liveabilityLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        imageView.addSubview(liveabilityLabel)
        imageView.fillSuperview()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 14
     
        nameLabel.anchor(top: nil, leading: imageView.leadingAnchor, bottom: imageView.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 20, bottom: 20, right: 0))
        
        liveabilityLabel.anchor(top: imageView.topAnchor, leading: nil, bottom: nil, trailing: imageView.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 20))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}
