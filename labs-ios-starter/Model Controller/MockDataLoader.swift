//
//  MockDataLoader.swift
//  labs-ios-starter
//
//  Created by Sal562 on 4/16/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit

public class MockDataLoader {
    
    var popularData = [Popular]()
    
    //create initializers
    init() {
        load()
    }
    
    ///create load function
    func load() {
        
        if let url = Bundle.main.url(forResource: "citydata", withExtension: "json") {
            
            ///do catch to get error
            do {
                let data = try Data(contentsOf: url)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([Popular].self, from: data)
                
                //put returned data inside @published popularData array
                self.popularData = dataFromJson
//                print("ORIGINAL Popular Data \(popularData)")
                
            } catch {
                print(error)
            }
        }
        
        
    }
}
 
