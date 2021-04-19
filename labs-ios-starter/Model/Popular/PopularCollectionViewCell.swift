//
//  PopularCollectionViewCell.swift
//  labs-ios-starter
//
//  Created by Sal562 on 4/19/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .darkGray
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
