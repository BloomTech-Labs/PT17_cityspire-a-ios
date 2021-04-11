//
//  FavCellS.swift
//  labs-ios-starter
//
//  Created by Sal562 on 4/11/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit


class FavCellS: UICollectionViewCell {
    
    //ADDVIEWS
    let appiconImageView = UIImageView(cornerRadius: 16)
    let nameLabel = UILabel(text: "City Name", font: .boldSystemFont(ofSize: 18), numberOfLines: 2)
    let descriptionLabel = UILabel(text: "Information about the City....", font: .systemFont(ofSize: 12, weight: .light) )
    
    let whatsNewLabel = UILabel(text: "Whats New", font: .boldSystemFont(ofSize: 18))
    
    let releaseNotesLabel = UILabel(text: "1.08 release notes", font: .systemFont(ofSize: 18), numberOfLines: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}
