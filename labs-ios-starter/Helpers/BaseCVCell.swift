//
//  BaseCVCell.swift
//  labs-ios-starter
//
//  Created by Sal562 on 4/11/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit

class BaseCVCell: UICollectionViewCell {
    
    override var isHighlighted: Bool {
        didSet {
            
            //Capture Identity
            var transform : CGAffineTransform = .identity
            
            if isHighlighted {
                transform = .init(scaleX: 0.9, y: 0.9)
            }
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 1,
                           initialSpringVelocity: 1,
                           options: .curveEaseOut,
                           animations: {
                            self.transform = transform
                           })
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //create backgroundView to fix rasterize (blurry bug)
        self.backgroundView = UIView()
        addSubview(self.backgroundView!)
        self.backgroundView?.fillSuperview()
        self.backgroundView?.backgroundColor = .white
        self.backgroundView?.layer.cornerRadius = 16
        //add a shadow to collectionview cell
        self.backgroundView?.layer.shadowOpacity = 0.1
        self.backgroundView?.layer.shadowRadius = 10
        //shift shadow pointing down
        self.backgroundView?.layer.shadowOffset = .init(width: 0, height: 10)
        //fix performance issues
        self.backgroundView?.layer.shouldRasterize = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}

