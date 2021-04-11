//
//  SearchVCS.swift
//  labs-ios-starter
//
//  Created by Sal562 on 4/11/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit
import MapKit

class SearchVCS: UITabBarController {
    
    //create MapView
    
    
    //create searchController
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    
    //create search function
    func setupSearchBar() {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        //setup search
        setupSearchBar()
        
        
    }
    
    //MARK: - IBOutlets
    @IBOutlet private var mapView: MKMapView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: - IB Actions
    
    @IBAction func favoriteButtonWasPressed(_ sender: UIBarButtonItem) {
    }
    
    
    
}

//MARK: - Extensions

extension SearchVCS : UISearchBarDelegate {
    
}

extension SearchVCS : UICollectionViewDelegateFlowLayout {
    
}
