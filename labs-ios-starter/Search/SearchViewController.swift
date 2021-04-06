//
//  SearchViewController.swift
//  labs-ios-starter
//
//  Created by Jarren Campos on 1/27/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit
import MapKit

class SearchViewController: UIViewController {
    // MARK: - Properties
    var searchResponse = Map()
    var network = NetworkClient()
    var city = "New York"
    var state = "NY"
    
    // MARK: Outlets
    @IBOutlet weak var backgroundGradient: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackgroundColor()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Background gradient
    
    /// Sets the gradient colors for the background view
    func setGradientBackgroundColor() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor(named: "LightBlue")!.cgColor, UIColor(named: "MedBlue")!.cgColor ]
        gradientLayer.shouldRasterize = true
        backgroundGradient.layer.addSublayer(gradientLayer)
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
    }
    
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
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "toMap" {
//            let vc = segue.destination as! MapScreenViewController
//            vc.searchItem = searchResponse
//
//
//            network.getCityData(city: city, state: state) { (cityData, error) in
//                if error != nil {
//                    DispatchQueue.main.async {
//                        vc.performSegue(withIdentifier: "unwindToSearch", sender: self)
//                    }
//                    return
//                }
//                DispatchQueue.main.async {
//                    vc.walkability = cityData?.walkability ?? 0
//                    vc.setUpViews()
//                    vc.counterForBlurView -= 1
//                    vc.checkCounter()
//                }
//            }
//        }
//    }
//
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
//                    vc.walkability = walkability
                    vc.setUpViews()
                    vc.counterForBlurView -= 1
                    vc.checkCounter()
                }
            }
        }
    }
}

extension SearchViewController: UISearchBarDelegate {
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
