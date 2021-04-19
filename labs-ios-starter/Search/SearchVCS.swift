//
//  SearchVCS.swift
//  labs-ios-starter
//
//  Created by Sal562 on 4/11/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit
import MapKit
import SDWebImage

class SearchVCS: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    let favoriteCell = "FavoritesCell"
    
    // MARK: - Properties
    var searchResponse = Map()
    var fetchController = FetchCitydataAPI()
    
    var city = City(cityName: "", cityState: "")
    var cityName = ""
    var stateName = ""
    var currentCity : City?
    var cityObject : [City] = []
    
    //create a array of dummyData 
    var popularFetchedData = [Popular]()
    
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
        
        /// Register Favorites Cell
        favoritesCollectionView.register(FavCellS.self, forCellWithReuseIdentifier: favoriteCell)
        
        popularFetchedData = MockDataLoader().popularData
        
        //reload cell
        DispatchQueue.main.async {
            self.favoritesCollectionView.reloadData()
        }
//        print("Latest Mock DATA \(popularFetchedData)")
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        searchBar.text = ""
        
    }
    
    //MARK: - Helper Function
    
    /// Creates a string based on the search query entered by the user
    func createStringURL(_ text: String?) -> Bool {
        guard var text = text else {
            return false
        }
        for char in text {
            if char == "," {
                text = text.replacingOccurrences(of: cityName, with: "")
                stateName = text.uppercased()
                stateName = stateName.replacingOccurrences(of: ",", with: "")
                stateName = stateName.replacingOccurrences(of: " ", with: "")
                break
            } else {
                cityName.append(char)
            }
        }
        cityName = cityName.capitalized
        if stateName.count != 2 || cityName.count < 2 {
            return false
        }
        city.cityName = cityName + ", " + stateName
        print("CityName", cityName)
        print("State", stateName)
        return true
    }
    
    ///search for city function
    func searchForCity() {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = city.cityName
        let activeSearch = MKLocalSearch(request: searchRequest)
        
        activeSearch.start { (response, error) in
            if response == nil {
                Alert.showBasicAlert(on: self, with: "Unable to find City", message: "Please try again")
            } else {
                guard let cityName = response?.mapItems.first?.name else {
                Alert.showBasicAlert(on: self, with: "Unable to find City", message: "Please try again")
                    return
                }
                
                // TO-DO: - Add logic later to precent empty or unformatted string entries
                
                self.cityName = cityName
                self.city.cityName = cityName
                self.city.cityState = self.stateName
                ///set long and lat
                self.city.longitude = (response?.boundingRegion.center.longitude)!
                self.city.latitude = (response?.boundingRegion.center.latitude)!
                
                
                ///OLD
                self.fetchController.getData(city: self.city) { (city) in
                    ///present error
                    if let error = error {
                        print(error)
                        return
                    }

                    //present data on main thread
                    DispatchQueue.main.async {
                        self.city = city
                        self.performSegue(withIdentifier: "CityDataSegue", sender: self)
                    }
                }
            }
        }
        
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CityDataSegue" {
            let cityDetailsVC = segue.destination as! CityDataViewController
            cityDetailsVC.cityObject.append(city)
            cityDetailsVC.fetchController = fetchController
        }
    }
    
 
    
    
    //MARK: - IB Actions
    
    @IBAction func favoriteButtonWasPressed(_ sender: UIBarButtonItem) {
        
        print("Favorites Button Pressed")
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularFetchedData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: favoriteCell, for: indexPath) as! FavCellS
       
        print(popularFetchedData.count)
        let mocData = popularFetchedData[indexPath.item]
        cell.nameLabel.textColor = .white
//        cell.backgroundColor = .green
//        print("MOC DATA", mocData)
        cell.imageView.sd_setImage(with: URL(string: mocData.imageUrl))
//        cell.imageView.image = #imageLiteral(resourceName: "4")
        cell.nameLabel.text = "\(mocData.city)" + ", " + "\(mocData.state)"
        cell.liveabilityLabel.text = "Livability:\(mocData.livability)"
        
        return cell
    }
    
    
}


//MARK: - Extensions
extension SearchVCS: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //move logic outside of delegate to searchForCity()
        let text = searchBar.text
        guard createStringURL(text) else {
            Alert.showBasicAlert(on: self, with: "Invalid Input", message: "Please use the format of \"City, State\"")
            return
        }
        //run search function
        searchForCity()
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

 
 
