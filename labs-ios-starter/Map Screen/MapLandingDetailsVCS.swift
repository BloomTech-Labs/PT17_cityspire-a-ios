//
//  MapLandingVCS.swift
//  labs-ios-starter
//
//  Created by Sal562 on 4/11/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit
import MapKit

class MapLandingDetailsVCS: BaseCVListController {

    let emptyView = UIImageView(cornerRadius: 14)
    
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        emptyView.backgroundColor = .yellow
//        view.addSubview(emptyView)
        
//        view.backgroundColor = .green
        title = searchItem.cityName
        collectionView.register(MapSearchResultsCellVCS.self, forCellWithReuseIdentifier: "searchCell")
        
//        let annotations = self.mapView.annotations
//        self.mapView.removeAnnotations(annotations)
        
    }
    
    // MARK: - Properties
    var counterForBlurView: Int = 1
    var searchItem = Map()
    var walkability: Walkability?
    var employmentStatement: String = ""
    var walkabilityStatement: String = ""
    var incomeStatement: String = ""
    var ageStatement: String = ""
    var livabilityStatement: String = ""
    var rentalStatement: String = ""

    var activityView = UIActivityIndicatorView(style: .large)
    
    
    
    
    //Show CollectionView with Stats for selected City
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "searchCell", for: indexPath) as! MapSearchResultsCellVCS
        
        print(searchItem)
        cell.cityNameLabel.text = searchItem.cityName
        cell.cityNameLabel.textColor = .red
        
        return cell
    }
    

    
    
    
}

extension MapLandingDetailsVCS: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 400)
    }
}
