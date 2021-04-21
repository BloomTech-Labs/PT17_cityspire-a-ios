//
//  FavoritesVCS.swift
//  labs-ios-starter
//
//  Created by Sal562 on 4/21/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit

class FavoritesVCS: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    let favCellID = "FavoriteCellID"
    
    //MARK: - IB Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //create a array of dummyPopularData
    var popularFetchedData = [Popular]()
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //register collectionView
        collectionView.register(FavCellS.self, forCellWithReuseIdentifier: favCellID)

        //fetch Popular Data
        popularFetchedData = MockDataLoader().popularData
    }
    
    //MARK: - CollectionView required methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularFetchedData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: favCellID, for: indexPath) as! FavCellS
        
        //DISPLAY CUSTOMCELL
        let mocData = popularFetchedData[indexPath.item]
        cell.imageView.sd_setImage(with: URL(string: mocData.imageUrl))
        
        cell.nameLabel.text = mocData.city
        cell.liveabilityLabel.text = "Livability Rating:\(mocData.livability)"
        
        return cell
    }
    
    //MARK: - UICollectionViewDelegateFlowLayout
 
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return .init(width: view.frame.width - 48, height: 300)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return .init(top: 25, left: 25, bottom: 25, right: 25)
        }
    

}
