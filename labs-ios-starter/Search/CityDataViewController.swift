//
//  CityDataViewController.swift
//  labs-ios-starter
//
//  Created by Sal562 on 4/11/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit

class CityDataViewController: UIViewController {
    
    // MARK: - Properties
    var counterForBlurView: Int = 1
    var searchItem = Map()
    var walkability: Walkability?
    var employmentStatement: String = ""
    var walkabilityStatement: String = ""
    var incomeStatement: String = ""
    var ageStatement: String = ""
    var livabilityStatement: String = ""
    //livability
    var rentalStatement: String = ""
    var diversityIndex: String = ""
    

    var activityView = UIActivityIndicatorView(style: .large)
    
    //MARK: - IBOutlets
    @IBOutlet weak var walkabilityLabel: UILabel!
    @IBOutlet weak var AirQualityLabel: UILabel!
    
    @IBOutlet weak var crimeLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var rentalPriceLabel: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = searchItem.cityName
//        view.backgroundColor = .systemPink
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
