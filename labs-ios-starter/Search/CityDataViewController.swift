//
//  CityDataViewController.swift
//  labs-ios-starter
//
//  Created by Sal562 on 4/11/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit

class CityDataViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    /// Set Identifier as Static Variable
    let cityDataId = "cityDataID"

    // MARK: - Properties
    var searchItem = Map()
    var walkability: Walkability?
    
    ///create local instance of City object
    var city: City?
    var fetchController : FetchCitydataAPI?
    var cityResultsData: [CityResultsData] = []
    
    ///create an empty object to store fetched data
    var cityObject: [City] = [] {
        didSet {
            currentCity = cityObject.last
        }
    }
    
    var currentCity : City? {
        didSet {
            if isViewLoaded {
                getCitySearchData()
                collectionView.reloadData()
            }
        }
    }
    
    ///Setup Activity View
    var activityView = UIActivityIndicatorView(style: .large)
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var cityNameStateHeaderLabel: UILabel!
    @IBOutlet weak var cityHeaderImagerBackgroundView: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = searchItem.cityName
        collectionView.delegate = self
        collectionView.dataSource = self
        cityNameStateHeaderLabel.textColor = .black
        
        cityHeaderImagerBackgroundView.backgroundColor = #colorLiteral(red: 0.7219179869, green: 0.8892920017, blue: 0.8767277598, alpha: 1)
        cityHeaderImagerBackgroundView.alpha = 0.65
        cityHeaderImagerBackgroundView.layer.cornerRadius = 14
        
        updateViews()
        ///register collectionView cell
        collectionView.register(CityDataVCSCollectionViewCell.self, forCellWithReuseIdentifier: cityDataId)
        
        getCitySearchData()
    }
    
 
    //MARK: - Helper Functions
    
    /// create dataStructure to hold values needed for display
    struct CityResultsData {
        var metricLabel: String
        var valueLabel: String
    }
    
    ///Stored property Data in a dictionary - to be used for presenting CustomCollectionViewCell
    func getCitySearchData() {
        
        ///unwrap city data
        guard let city = currentCity else { return }
        cityResultsData = []
        
        //Population Data - Cannot be zero - create and append to dictionary
        if let population = city.population {
            let cityDataMetrics = CityResultsData(metricLabel: "Population of:", valueLabel: "\(population)")
            cityResultsData.append(cityDataMetrics)
        }
        
        //Walkability Data
        if let walkability = city.walkability {
            let cityDataMetrics = CityResultsData(metricLabel: "Walkability Rating:", valueLabel: "\(walkability)")
            cityResultsData.append(cityDataMetrics)
        }
        
        //Air Quality Data
        if let airQuality = city.airQuality {
            let cityDataMetrics = CityResultsData(metricLabel: "Air Quality Rating:", valueLabel: "\(airQuality)")
            cityResultsData.append(cityDataMetrics)
        }
        
        //Crime Data
        if let crimeData = city.crime{
            let cityDataMetrics = CityResultsData(metricLabel: "Crime Rating:", valueLabel: "\(crimeData)")
            cityResultsData.append(cityDataMetrics)
        }
        
        //Rental Price Data
        if let rentalPrice = city.rentalPrice {
            let cityDataMetrics = CityResultsData(metricLabel: "The Average Rent is:", valueLabel: "$\(rentalPrice)")
            cityResultsData.append(cityDataMetrics)
        }
        
    }
    
    ///Update View with Data Object on Load
    func updateViews() {
        guard let city = currentCity else {
            return
        }
        
        ///Unwrapped City Data
//        print("The City is: ", city)
        ///set Title to Searched (current) city
        navigationController?.title = city.cityName
        print("City/Cityname \(city.cityName)")
        cityNameStateHeaderLabel.text = "\(city.cityName)" + ", " + "\(city.cityState)"

    }
    
    //MARK: - IBActions
    
    @IBAction func mapButtonWasPressed(_ sender: UIBarButtonItem) {
        print("Map Button Pressed")
        performSegue(withIdentifier: "MapSegueID", sender: self)
    }
    
    //MARK: - Required Methods for Collectionview
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cityResultsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cityDataId, for: indexPath) as! CityDataVCSCollectionViewCell
        cell.backgroundColor = #colorLiteral(red: 0.7231394649, green: 0.8902314305, blue: 0.8783438802, alpha: 1)
        cell.alpha = 0.60
        cell.layer.cornerRadius = 14
        //Set City Data Stored in Local Instance here
//        cell.metricLabel.text = "The City Population is:"
//        cell.cityDataMetricValue.text = "510,000 People"
        //Present Data from StoredArray
        cell.metricLabel.text =  cityResultsData[indexPath.item].metricLabel
        cell.cityDataMetricValue.text = cityResultsData[indexPath.item].valueLabel
        print("The CitySEARCHDATA is" , cityResultsData)
        return cell
    }
    
    //MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 48, height: 80)
    }
    
    
    //MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MapSegueID" {
            let cityMapVC = segue.destination as! CityMapVCS
            cityMapVC.city = currentCity
            cityMapVC.navigationItem.title = currentCity!.cityName + ", " + currentCity!.cityState
        }
    }
 

}
