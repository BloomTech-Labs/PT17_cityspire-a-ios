//
//  CityDataCVS.swift
//  labs-ios-starter
//
//  Created by Sal562 on 4/12/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit
import MapKit

class CityDataCVS : BaseCVListController {
    
    let cityDataCellId = "CityDataCellId"
    let headerCellId = "HeaderCell"
    
    //create cityDataObject to holdData
    var cityDataResults = [CityData]()
    
    // MARK: - Properties
    var searchResponse = Map()
    var network = NetworkClient()
    var city = "New York"
    var state = "NY"
    
    //timer for search
    var timer : Timer?
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        //Register CityDataCell
        collectionView.register(CityDataCellS.self, forCellWithReuseIdentifier: cityDataCellId)
        
        //Register headerCell
        collectionView.register(CityDataHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerCellId)
        
        fetchData()

    }
    
    //MARK: - Functions
    func fetchData() {
        
        
        
        network.getCityData(city: city, state: state) { (cityData, error) in
            if error != nil {
                print(error?.localizedDescription)
            }
            
            DispatchQueue.main.async {
                //setLabels
                print(cityData)
                
            }
            
            
        }
        
        
//        network.getCityData(city: searchResponse.cityName, state: state) { (cityData, error) in
//                       if error != nil {
//                           print(error?.localizedDescription)
//                       }
//       
//                       DispatchQueue.main.async {
//       //                    print("City Walkability Score: \(cityData?.walkability ?? 0)")
//                           vc.walkabilityLabel.text = "The Walkability is \(cityData?.walkability ?? 0)"
//                           vc.AirQualityLabel.text = "The Air Quality Index is \(cityData?.airQualityIndex ?? "n/a")"
//                           vc.crimeLabel.text = "The Crime Index is \(cityData?.crime ?? "n/a")"
//                           vc.populationLabel.text = "The Population of \(self.searchResponse.cityName ) is \(cityData?.population ?? 0) Million)"
//                           vc.rentalPriceLabel.text = "The Average Rent is $\(cityData?.rentalPrice ?? 0))"
//                           //add
//                           //diversityIndex
//                           //livability
//                       }
//       
//       //                @IBOutlet weak var rentalPriceLabel: UILabel!
//       
//                       return
//                   }
//       
//               }
        
    }
    
    //MARK: - Required Methods CollectionView
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cityDataCellId, for: indexPath) as! CityDataCellS
        
        //presentCityData
//        let cityDataGroup = cityDataResults[indexPath.item]
        
        //set properties
//        cell.populationLabel.text = "Population: \(cityDataGroup.population ?? 420)"
//        cell.crimeLabel.text =  "Crime: \(cityDataGroup.crime ?? "Default Crime")"
//        cell.airQualityLabel.text =  "Air Quality: \(cityDataGroup.airQualityIndex ?? "Default Air")"
//        cell.livabilityLabel.text =  "Livability: \(cityDataGroup.livability ?? 420)"
//        cell.rentalPriceLabel.text = "Average Rent $: \(cityDataGroup.rentalPrice ?? 420)"
    
        return cell
    }
    
    
    //MARK: - Required Methods for Header
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerCellId, for: indexPath) as! CityDataHeader
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 200)
    }
    
    
}

extension CityDataCVS: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 250)
    }
    

}
