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
    let appiconImageView = UIImageView(cornerRadius: 16)
    let nameLabel = UILabel(text: "Popular City Name", font: .boldSystemFont(ofSize: 30), numberOfLines: 1)
    let descriptionLabel = UILabel(text: "Information about the City....", font: .systemFont(ofSize: 12, weight: .light) )
    
    let whatsNewLabel = UILabel(text: "Whats New", font: .boldSystemFont(ofSize: 18))
    
    let releaseNotesLabel = UILabel(text: "1.08 release notes", font: .systemFont(ofSize: 18), numberOfLines: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView.contentMode = .scaleAspectFill
        addSubview(nameLabel)
        addSubview(imageView)
        addSubview(nameLabel)
        imageView.fillSuperview()
        nameLabel.textColor = .white
     
        nameLabel.anchor(top: nil, leading: imageView.leadingAnchor, bottom: imageView.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 20, bottom: 20, right: 0))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}
