//
//  MapViewController.swift
//  Albalad
//
//  Created by Nora on 11/06/1443 AH.
//

import UIKit
import MapKit

class MapViewController: UIViewController , UISearchBarDelegate , MKMapViewDelegate {
    
    var mapOutLit : MKMapView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(MKMapView())
    
    
    var newAnnotation : MKPointAnnotation = {
        $0.title = "My Fav place"
        return $0
    }(MKPointAnnotation())
    
    var newwwAnnotation : MKPointAnnotation = {
        $0.title = "مكاني الجديد على الخريطة"
        return $0
    }(MKPointAnnotation())
    
    var searchBar:UISearchBar = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.searchBarStyle = UISearchBar.Style.default
        $0.placeholder = "Search..."
        $0.sizeToFit()
        $0.isTranslucent = false
        $0.backgroundImage = UIImage()
        return $0
    }(UISearchBar())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        setUp()
        
        let latitude : CLLocationDegrees = 21.488693889457913
        let longitude : CLLocationDegrees = 39.185518499255636
        
        let lanData : CLLocationDegrees = 0.05
        let lonData : CLLocationDegrees = 0.05
        
        let span = MKCoordinateSpan(latitudeDelta: lanData, longitudeDelta: lonData)
        
        let cooridnates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let region = MKCoordinateRegion(center: cooridnates, span: span)
        
        mapOutLit.setRegion(region, animated: true)
        newAnnotation.coordinate = cooridnates
        mapOutLit.addAnnotation(newAnnotation)
        
        
        let uiLpgr = UILongPressGestureRecognizer(target: self, action: #selector(longPressGeuster(geusterRecognizer:)))
        uiLpgr.minimumPressDuration = 2
        mapOutLit.addGestureRecognizer(uiLpgr)
    }
    
    
    func setUp() {
        
        view.backgroundColor = .white
        view.addSubview(mapOutLit)
        view.addSubview(searchBar)
        
        NSLayoutConstraint.activate([
            
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 20),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchBar.bottomAnchor.constraint(equalTo: mapOutLit.topAnchor),
            
            mapOutLit.topAnchor.constraint(equalTo: searchBar.bottomAnchor ,constant: 10),
            mapOutLit.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapOutLit.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapOutLit.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
        
    }
    
    
    @objc func longPressGeuster( geusterRecognizer : UIGestureRecognizer) {
        
        let touchPoint = geusterRecognizer.location(in: self.mapOutLit)
        let coordinte = mapOutLit.convert(touchPoint, toCoordinateFrom: self.mapOutLit)
        
        newwwAnnotation.coordinate = coordinte
        mapOutLit.addAnnotation(newwwAnnotation)
    }
    
}
