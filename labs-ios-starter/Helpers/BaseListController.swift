//
//  BaseListController.swift
//  labs-ios-starter

//  Created by Sal562 on 3/26/21.
//  Copyright © 2021 Sal B. Amer. All rights reserved.
//

import UIKit

//Use for Programmatic implementations only

class BaseCVListController: UICollectionViewController {
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
}
