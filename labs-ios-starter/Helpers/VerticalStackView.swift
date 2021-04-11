//
//  VerticalStackView.swift
//  labs-ios-starter
//
//  Created by Sal562 on 3/23/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import UIKit

class VerticalStackView: UIStackView {

    init(arrangedSubviews: [UIView], spacing: CGFloat = 0) {

        //
        super.init(frame: .zero)
        
        //use for loop to arrange subviews
        arrangedSubviews.forEach({ addArrangedSubview($0)})

        
        //set spacing
        self.spacing = spacing
        //set axis
        self.axis = .vertical
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
}


 
