//
//  CityMapVCS.swift
//  labs-ios-starter
//
//  Created by Sal562 on 4/15/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit
import MapKit

class CityMapVCS: UIViewController , MKMapViewDelegate{

    var city: City?
    var span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.25, longitudeDelta: 0.25)
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()
    }
    
    //MARK: - Helper Functions
    func setupMapView() {
        guard let city = city else { return }
        navigationController?.navigationItem.title = "\(city.cityName)" + ", " + "\(city.cityState)"
        mapView.delegate = self
        //add annotations
        let annotations = mapView.annotations
        let coordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(city.latitude, city.longitude)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: "poiAnnotation")
    }
    

 

}
