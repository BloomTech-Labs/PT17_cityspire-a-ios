//
//  CityDataHeaderHorizontalCV.swift
//  labs-ios-starter
//
//  Created by Sal562 on 4/12/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit

class CityDataHeaderHorizontalCV : HorizontalSnappingCVController, UICollectionViewDelegateFlowLayout {
    
    let cityHeaderCellID = "cityHeaderCell"
    
    //City Image
    let cityImage = UIImageView(cornerRadius: 16)
    //title
    let titleLabel = UILabel(text: "City of Life", font: .systemFont(ofSize: 18, weight: .semibold))
    //subtitle
    let subTitle = UILabel(text: "Rated the Best Place in America", font: .systemFont(ofSize: 12, weight: .light))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .yellow
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cityHeaderCellID)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 28, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cityHeaderCellID, for: indexPath)
        
        return cell
    }
 
    
}
