//
//  NewSearchViewController.swift
//  labs-ios-starter
//
//  Created by Sal562 on 4/1/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit

class NewSearchViewController: UITabBarController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var airQualityLabel: UILabel!
    @IBOutlet weak var crimeLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var liveabilityLabel: UILabel!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        

        // Do any additional setup after loading the view.
    }
}

extension NewSearchViewController: UISearchBarDelegate {
    
}
