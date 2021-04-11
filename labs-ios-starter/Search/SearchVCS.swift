//
//  SearchVCS.swift
//  labs-ios-starter
//
//  Created by Sal562 on 4/11/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit
import MapKit

class SearchVCS: UIViewController {
    
    // MARK: - Properties
    var searchResponse = Map()
    var network = NetworkClient()
    var city = "New York"
    var state = "NY"
    
    //timer for search
    var timer : Timer?
    
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
    
    
    
    //MARK: - IBOutlets
    @IBOutlet private var mapView: MKMapView!
    @IBOutlet weak var searchBar: UISearchBar!
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMap" {
            let vc = segue.destination as! MapScreenViewController
            vc.searchItem = searchResponse
            
            network.getWalkability(city: city, state: state) { (walkability, error) in
                if error != nil {
                    DispatchQueue.main.async {
                        vc.performSegue(withIdentifier: "unwindToSearch", sender: self)
                    }
                    return
                }
                DispatchQueue.main.async {
                    vc.walkability = walkability
                    vc.setUpViews()
                    vc.counterForBlurView -= 1
                    vc.checkCounter()
                }
            }
        }
    }
    
    //MARK: - IB Actions
    
    @IBAction func favoriteButtonWasPressed(_ sender: UIBarButtonItem) {
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
                self.performSegue(withIdentifier: "toMap", sender: self)
                
                
            }
        }
    }
}

extension SearchVCS : UICollectionViewDelegateFlowLayout {
    
}
