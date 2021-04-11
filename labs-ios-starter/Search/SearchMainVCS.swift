//
//  SearchMainVCS.swift
//  labs-ios-starter
//
//  Created by Sal562 on 4/11/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit


class SearchMainVCS : UIViewController, UISearchBarDelegate, UISearchControllerDelegate {
    
    //create search bar controller
    let searchController = UISearchController(searchResultsController: nil)
 
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.delegate = self
        searchController.searchBar.delegate = self
        view.backgroundColor = .red
    }
    
    //MARK: - Variables
    var timer : Timer?
    
    //MARK: - Helper Functions

    func setupSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
    }
    
    //collectionview Results
    
    
    //search bar required methods
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
    
    
}
