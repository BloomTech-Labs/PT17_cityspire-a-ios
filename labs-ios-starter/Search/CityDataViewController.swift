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
    
    //IBOutlets for weather Widget
    @IBOutlet weak var backgroundWeatherView: UIView!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = searchItem.cityName
        collectionView.delegate = self
        collectionView.dataSource = self
        cityHeaderImagerBackgroundView.backgroundColor = #colorLiteral(red: 0.04957468063, green: 0.4228932858, blue: 0.7525009513, alpha: 0.8461312072)
//        cityHeaderImagerBackgroundView.alpha = 0.65
        cityHeaderImagerBackgroundView.layer.cornerRadius = 14
        cityNameStateHeaderLabel.textColor = .white
        
        updateViews()
        ///register collectionView cell
        collectionView.register(CityDataVCSCollectionViewCell.self, forCellWithReuseIdentifier: cityDataId)
        
        getCitySearchData()
        
        //update weather data
        updateWeatherData()
    }
    
 
    //MARK: - Helper Functions
    
    /// create dataStructure to hold values needed for display
    struct CityResultsData {
//        var icon: UIImage
        var metricLabel: String
        var valueLabel: String
//        var emojiLabel: String
        var emojiImage: UIImage
    }
    
    ///Stored property Data in a dictionary - to be used for presenting CustomCollectionViewCell
    func getCitySearchData() {
        
        ///unwrap city data
        guard let city = currentCity else { return }
        cityResultsData = []
        
        //Population Data - Cannot be zero - create and append to dictionary
        if let population = city.population {
            let cityDataMetrics = CityResultsData(metricLabel: " Population of: ", valueLabel: "\(population)", emojiImage: UIImage(systemName: "person.3.fill") ?? #imageLiteral(resourceName: "search"))
            cityResultsData.append(cityDataMetrics)
        }
        
        //Air Quality Data
        if let airQuality = city.airQuality {
            let cityDataMetrics = CityResultsData(metricLabel: " Air Quality Rating: ", valueLabel: "\(airQuality)", emojiImage: UIImage(systemName: "lungs.fill") ?? #imageLiteral(resourceName: "search"))
            cityResultsData.append(cityDataMetrics)
        }
        
        //Crime Data
        if let crimeData = city.crime{
            let cityDataMetrics = CityResultsData(metricLabel: " Crime Rating: ", valueLabel: "\(crimeData)", emojiImage: UIImage(systemName: "binoculars.fill") ?? #imageLiteral(resourceName: "search"))
            cityResultsData.append(cityDataMetrics)
        }
        
        //Livability Data
        if let liveabilityScore = city.livability {
            let cityDataMetrics = CityResultsData(metricLabel: " Livability Rating: ", valueLabel: "\(liveabilityScore)", emojiImage: UIImage(systemName: "figure.wave") ?? #imageLiteral(resourceName: "search"))
            cityResultsData.append(cityDataMetrics)
        }
        
        //Rental Price Data
        if let rentalPrice = city.rentalPrice {
            let cityDataMetrics = CityResultsData(metricLabel: " Average Rent: ", valueLabel: "$\(rentalPrice)", emojiImage: UIImage(systemName: "dollarsign.circle.fill") ?? #imageLiteral(resourceName: "search"))
            cityResultsData.append(cityDataMetrics)
        }
        
        //Diversity Data
        if let diversityScore = city.diversityIndex {
            let cityDataMetrics = CityResultsData(metricLabel: " Diversity Rating: ", valueLabel: "\(diversityScore)", emojiImage: UIImage(systemName: "mail.stack.fill") ?? #imageLiteral(resourceName: "search"))
            cityResultsData.append(cityDataMetrics)
        }
        
        ////    "percent_high_performing_schools": 12,
        //percent_high_performing_schools Data
        if let highSchoolPerformance = city.highPerformingSchools {
            let cityDataMetrics = CityResultsData(metricLabel: " High Schools Rating: ", valueLabel: "\(highSchoolPerformance)", emojiImage: UIImage(systemName: "graduationcap.fill") ?? #imageLiteral(resourceName: "search"))
            cityResultsData.append(cityDataMetrics)
        }
        
        //    "transitscore": 84,
        //Transit Data
        if let transitScore = city.diversityIndex {
            let cityDataMetrics = CityResultsData(metricLabel: " Public Transport Rating: ", valueLabel: "\(transitScore)", emojiImage: UIImage(systemName: "tram.fill") ?? #imageLiteral(resourceName: "search"))
            cityResultsData.append(cityDataMetrics)
        }
        
        //Walkability Data
        if let walkability = city.walkability {
            let cityDataMetrics = CityResultsData(metricLabel: " Walkability Rating: ", valueLabel: "\(walkability)", emojiImage: UIImage(systemName: "figure.walk.diamond.fill") ?? #imageLiteral(resourceName: "search"))
            cityResultsData.append(cityDataMetrics)
        }
        //    "bikescore": 70,
        //Biking Data
        if let bikingScore = city.diversityIndex {
            let cityDataMetrics = CityResultsData(metricLabel: " Biker Friendliness Rating: ", valueLabel: "\(bikingScore)", emojiImage: UIImage(systemName: "bicycle.circle.fill") ?? #imageLiteral(resourceName: "search"))
            cityResultsData.append(cityDataMetrics)
        }
        
    }
    
    //Update Weather Data
    func updateWeatherData() {
        guard let currentCity = currentCity else { return }
        
        fetchController?.getWeatherData(cityName: currentCity, completion: { (weatherData, error) in
            
            let images = [
                UIImage(named: "cloud"),
                UIImage(named: "sunny"),
                UIImage(named: "lightning"),
                UIImage(named: "rainMix"),
                UIImage(named: "wi-day-cloudy"),
                UIImage(named: "windy")
            ]
            guard let weatherData = weatherData else { return }
            
            DispatchQueue.main.async {
                self.weatherImage.image = images.randomElement()!!
                self.descriptionLabel.text = weatherData.description
                self.temperatureLabel.text = weatherData.temperature
                self.humidityLabel.text = weatherData.humidity
                self.windLabel.text = weatherData.windSpeed
                self.feelsLikeLabel.text = weatherData.feelsLike
            }
//            print(weatherData)
        })
    }
    
    ///Update View with Data Object on Load
    func updateViews() {
        guard let city = currentCity else {
            return
        }
        
        ///Unwrapped City Data
//        print("The City is: ", city)
        ///set Title to Searched (current) city
        title = city.cityName
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
        cell.backgroundColor = #colorLiteral(red: 0.04523042589, green: 0.431027025, blue: 0.768438518, alpha: 1)
//        cell.alpha = 0.60
        cell.layer.cornerRadius = 14
        cell.cityDataMetricValue.textColor = .white
        cell.metricLabel.textColor = .white
        cell.emojiImage.tintColor = .white

        //Set City Data Stored in Local Instance here
//        cell.metricLabel.text = "The City Population is:"
//        cell.cityDataMetricValue.text = "510,000 People"
        //Present Data from StoredArray
//        cell.emojiLabel.text = cityResultsData[indexPath.item].emojiLabel
        cell.emojiImage.image = cityResultsData[indexPath.item].emojiImage
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
