//
//  SearchVCS.swift
//  labs-ios-starter
//
//  Created by Sal562 on 4/11/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit
import MapKit

class SearchVCS: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    let favoriteCell = "FavoritesCell"
    
    // MARK: - Properties
    var searchResponse = Map()
    var network = NetworkClient()
    var city = "New York"
    var state = "NY"
    
    //timer for search
    var timer : Timer?
    
    //MARK: - Outlets
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var favoritesCollectionView: UICollectionView!
    
    //create search function
    func setupSearchBar() {
        definesPresentationContext = true
        //set delegate to searchBar
        searchBar.delegate = self

       
    }
    
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        //setup search
        setupSearchBar()
        
        favoritesCollectionView.register(FavoritesCollectionViewCell.self, forCellWithReuseIdentifier: favoriteCell)
        
        
    }
    
    //MARK: - Helper Function
    
    /// Creates a string based on the search query entered by the user
    func createStringURL(_ input: String) {
        var address = input
        for char in address {
            if char == "," {
                address = address.replacingOccurrences(of: city, with: "")
                state = address
                state = state.replacingOccurrences(of: ",", with: "")
                state = state.replacingOccurrences(of: " ", with: "")
                return
            } else {
                city.append(char)
            }
        }
    }
    
    
    
  
    
    // MARK: - Navigation

// Prepare to segue
    
    
    //MARK: - IB Actions
    
    @IBAction func favoriteButtonWasPressed(_ sender: UIBarButtonItem) {
        
        print("Favorites Button Pressed")
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: favoriteCell, for: indexPath)
        cell.backgroundColor = .yellow
        return cell
    }
    
    
    
}

//MARK: - Extensions
extension SearchVCS: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchRequest = MKLocalSearch.Request()
        
        searchRequest.naturalLanguageQuery = searchBar.text
        let activeSearch = MKLocalSearch(request: searchRequest)
        
        activeSearch.start { (response, error) in
            if response == nil {
                Alert.showBasicAlert(on: self, with: "Invalid Input", message: "Please use the format of \"City, State\"")
            } else {
                self.searchResponse.long = (response?.boundingRegion.center.longitude)!
                self.searchResponse.lat = (response?.boundingRegion.center.latitude)!
                self.searchResponse.cityName = searchBar.text!
                self.createStringURL(searchBar.text!)
                self.performSegue(withIdentifier: "MapDetails", sender: self)
                 
            }
        }
    }
    
    
}

//extension SearchVCS: UISearchBarDelegate {
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        let searchRequest = MKLocalSearch.Request()
//
//        searchRequest.naturalLanguageQuery = searchBar.text
//        let activeSearch = MKLocalSearch(request: searchRequest)
//
//        activeSearch.start { (response, error) in
//            if response == nil {
//                Alert.showBasicAlert(on: self, with: "Invalid Input", message: "Please use the format of \"City, State\"")
//            } else {
//                self.searchResponse.long = (response?.boundingRegion.center.longitude)!
//                self.searchResponse.lat = (response?.boundingRegion.center.latitude)!
//                self.searchResponse.cityName = searchBar.text!
//                self.createStringURL(searchBar.text!)
//                self.performSegue(withIdentifier: "toMap", sender: self)
//
//
//            }
//        }
//    }
//}
 
