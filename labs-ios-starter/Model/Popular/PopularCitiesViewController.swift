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

    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //register custom cell
        collectionView.register(PopularCollectionViewCell.self, forCellWithReuseIdentifier: favCellID)
    }
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Collectionview Required
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: favCellID, for: indexPath) as!PopularCollectionViewCell
        cell.backgroundColor = .green
        return cell
    }
    
    //MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 48, height: 80)
    }


}
