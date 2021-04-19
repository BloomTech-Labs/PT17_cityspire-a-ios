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
    
    let topRatedImage = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //top rated image
        topRatedImage.image = #imageLiteral(resourceName: "toprated")
        topRatedImage.frame = .init(x: 100, y: 0, width: 200, height: 60)
//        topRatedImage.centerXInSuperview()

        topRatedImage.contentMode = .scaleAspectFit
    
        // stackview for label
        addSubview(imageView)
        let stackView = VerticalStackView(arrangedSubviews: [nameLabel, liveabilityLabel], spacing: 2)
        liveabilityLabel.textColor = .white
        
        //imageview properties
        imageView.alpha = 0.85
        imageView.addSubview(stackView)
        imageView.addSubview(topRatedImage)
        imageView.fillSuperview()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 14
        stackView.anchor(top: nil, leading: imageView.leadingAnchor, bottom: imageView.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 20, bottom: 20, right: 0))
        
//        topRatedImage.anchor(top: imageView.topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 10, left: 0, bottom: 0, right: 0))
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}
