//
//  CityDataHeader.swift
//  labs-ios-starter
//
//  Created by Sal562 on 4/12/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit

class CityDataHeader: UICollectionReusableView {
    
    //create Controller for this View
    let cityDataHeaderHorizontalController = CityDataHeaderHorizontalCV()
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //addViewController Blank As Test
        addSubview(cityDataHeaderHorizontalController.view)
        cityDataHeaderHorizontalController.view.fillSuperview()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
