//
//  PopularCitiesViewController.swift
//  labs-ios-starter
//
//  Created by Sal562 on 4/18/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit

class PopularCitiesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let favCellID = "favcellID"
    
    //create a array of dummyPopularData
    var popularFetchedData = [Popular]()

    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //register custom cell
        collectionView.register(PopularCollectionViewCell.self, forCellWithReuseIdentifier: favCellID)
        
        //fetch Popular Data
        popularFetchedData = MockDataLoader().popularData
    }
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Collectionview Required
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularFetchedData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: favCellID, for: indexPath) as!PopularCollectionViewCell
        
        //DISPLAY CUSTOMCELL
        let mocData = popularFetchedData[indexPath.item]
//        cell.backgroundColor = .green
        cell.cityName.text = mocData.city
         
        return cell
    }
    
    //MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 48, height: 80)
    }


}
