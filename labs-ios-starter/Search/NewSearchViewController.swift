//
//  NewSearchViewController.swift
//  labs-ios-starter
//
//  Created by Sal562 on 4/1/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit

class NewSearchViewController: UITabBarController {
    
    
    //MARK: - Variables
    let networkClient = NetworkClient()
    let city : String? = ""
    let state : String? = ""
    
    //MARK: - Outlets
    
    @IBOutlet weak var airQualityLabel: UILabel!
    @IBOutlet weak var crimeLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var liveabilityLabel: UILabel!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        searchBar.delegate = self
        view.backgroundColor = .white
        
        fetchCityData(city: "New York", state: "NY")
        // Do any additional setup after loading the view.
    }
    
    
    //get city data
    func fetchCityData(city: String, state: String) -> Void {
        networkClient.getCityData(city: city, state: state) { (cityData, error) in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            print(cityData)
//            self.airQualityLabel.text = "The AirQuality Index is: \(String(describing: cityData?.airQualityIndex))"
//            self.crimeLabel.text = "The CrimeData Index is: \(cityData?.crime)"
//            self.populationLabel.text = "The Population is: \(cityData!.population)"
//            self.liveabilityLabel.text = "The Liveability Index is: \(cityData!.livability)"
        }
    }
    
    
}

extension NewSearchViewController: UISearchBarDelegate {
    
}
