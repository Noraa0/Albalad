//
//  AlbaladMap.swift
//  Albalad
//
//  Created by Nora on 01/06/1443 AH.
//

import UIKit
import GoogleMaps
import CoreLocation

class AlbaladMap: UIViewController  {

    let myLocation = CLLocationManager()
    
    var locationLable: UILabel = {
        $0.text = "الموقع"
        $0.textAlignment = .center
        $0.textColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    
     
    var mapView : UIView = {
      $0.translatesAutoresizingMaskIntoConstraints = false
      $0.backgroundColor = .white
      return $0
    }(UIView())
    
    
    
//    var mapPin : UIPinchGestureRecognizer
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//      myLocation.delegate = self
        myLocation.requestWhenInUseAuthorization()
        myLocation.stopUpdatingLocation()
        
        
        view.addSubview(mapView)
        mapView.addSubview(locationLable)
        
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor , constant: -10),
            mapView.leftAnchor.constraint(equalTo: view.leftAnchor),
            mapView.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            locationLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 400),
            locationLable.bottomAnchor.constraint(equalTo: mapView.bottomAnchor),
            locationLable.leftAnchor.constraint(equalTo: mapView.leftAnchor),
            locationLable.rightAnchor.constraint(equalTo: mapView.rightAnchor)
            
            
            
            ])

    }
    



}
