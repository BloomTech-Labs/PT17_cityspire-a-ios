//
//  SearchVCS.swift
//  labs-ios-starter
//
//  Created by Sal562 on 4/11/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit
import MapKit

class SearchVCS: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    let favoriteCell = "FavoritesCell"
    
    // MARK: - Properties
    var searchResponse = Map()
    var network = NetworkClient()
    var city = "New York"
    var state = "NY"
    
    //timer for search
    var timer : Timer?
    
    //MARK: - Outlets
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
        favoritesCollectionView.dataSource = self
        favoritesCollectionView.delegate = self
        //setup search
        setupSearchBar()
        
        favoritesCollectionView.register(FavCellS.self, forCellWithReuseIdentifier: favoriteCell)
        
        
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let cityDataVC = CityDataCVS()
        present(cityDataVC, animated: true)
        
//        if segue.identifier == "CityDataSegue" {
//            let vc = segue.destination as! CityDataViewController
//            vc.searchItem = searchResponse
//
//            network.getCityData(city: searchResponse.cityName, state: state) { (cityData, error) in
//                if error != nil {
//                    print(error?.localizedDescription)
//                }
//
//                DispatchQueue.main.async {
////                    print("City Walkability Score: \(cityData?.walkability ?? 0)")
//                    vc.walkabilityLabel.text = "The Walkability is \(cityData?.walkability ?? 0)"
//                    vc.AirQualityLabel.text = "The Air Quality Index is \(cityData?.airQualityIndex ?? "n/a")"
//                    vc.crimeLabel.text = "The Crime Index is \(cityData?.crime ?? "n/a")"
//                    vc.populationLabel.text = "The Population of \(self.searchResponse.cityName ) is \(cityData?.population ?? 0) Million)"
//                    vc.rentalPriceLabel.text = "The Average Rent is $\(cityData?.rentalPrice ?? 0))"
//                    //add
//                    //diversityIndex
//                    //livability
//                }
//
////                @IBOutlet weak var rentalPriceLabel: UILabel!
//
//                return
//            }
//
//        }
    }
    
    
    //MARK: - IB Actions
    
    @IBAction func favoriteButtonWasPressed(_ sender: UIBarButtonItem) {
        
        print("Favorites Button Pressed")
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        print(searchText)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: favoriteCell, for: indexPath) as! FavCellS
        cell.imageView.image = UIImage(named: "ny")
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
                
                
                
                self.performSegue(withIdentifier: "CityDataSegue", sender: self)
                 
            }
        }
    }
}


extension SearchVCS: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 48, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 25, left: 25, bottom: 25, right: 25)
    }
}

 
 
