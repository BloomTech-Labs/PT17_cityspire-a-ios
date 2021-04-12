//
//  CityDataCVS.swift
//  labs-ios-starter
//
//  Created by Sal562 on 4/12/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit

class CityDataCVS : BaseCVListController {
    
    let cityDataCellId = "TrackCellId"
    let headerCellId = "HeaderCell"
        
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        //Register CityDataCell
        
        //Register headerCell

    }
    
    //MARK: - Required Methods CollectionView
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cityDataCellId, for: indexPath)
        
        return cell
    }
    
    
}

extension CityDataCVS: UICollectionViewDelegateFlowLayout {
    
    
}
