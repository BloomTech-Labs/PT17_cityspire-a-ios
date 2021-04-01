//
//  NewSearchViewController.swift
//  labs-ios-starter
//
//  Created by Sal B Amer on 4/1/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit

class NewSearchViewController: UIViewController {
    
    //MARK: - Variables
    let networkClient = NetworkClient()
    let city : String? = ""
    let state : String? = ""
    
//    var fetchedCityData = [CityData]()
    
    //MARK: - Outlets
    
    @IBOutlet weak var airQualityLabel: UILabel!
    @IBOutlet weak var crimeLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var livabilityLabel: UILabel!
    
    @IBOutlet weak var diversityIndexLabel: UILabel!
    @IBOutlet weak var rentalPriceLabel: UILabel!
    @IBOutlet weak var walkabilityIndexLabel: UILabel!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        searchBar.delegate = self
        view.backgroundColor = .white
        

        fetchCityData(city: "Los Angeles", state: "CA")
    }
    
    //get city data
    func fetchCityData(city: String, state: String) -> Void {
        networkClient.getCityData(city: city, state: state) { [weak self] (cityData, error) in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            print("Just CiTYDATA \(cityData)")
            
            guard let cityData = cityData else { return }
            
            DispatchQueue.main.async {
                self!.airQualityLabel.text = "The AirQuality Index is: \(cityData.airQualityIndex ?? "NA")"
                self!.crimeLabel.text = "The CrimeData Index is: \(cityData.crime ?? "NA")"
                self!.populationLabel.text = "The Population is: \(cityData.population ?? 0)"
                self!.livabilityLabel.text = "The Livability Index is: \(cityData.livability ?? 0)"
                self!.diversityIndexLabel.text = "The Diversity Index is: \(cityData.diversityIndex ?? 0)"
                self!.rentalPriceLabel.text = "The Avg Rental Prices is: $\(cityData.rentalPrice ?? 0)"
                self!.walkabilityIndexLabel.text = "The Walkability Index is: \(cityData.walkability ?? 0)"
                self!.navigationItem.title = cityData.city.city?.capitalized
            }

        }
    }
    
    
}

extension NewSearchViewController: UISearchBarDelegate {
    
}
