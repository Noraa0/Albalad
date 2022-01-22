//
//  MapViewController.swift
//  Albalad
//
//  Created by Nora on 11/06/1443 AH.
//

import UIKit
import MapKit

class MapViewController: UIViewController , MKMapViewDelegate {
    
    
    var mapLable: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "خريطة البلد"
        $0.font = UIFont(name: "GillSans-Italic", size: 25)
        $0.textColor = .black
        return $0
    }(UILabel())
    
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
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
        view.addSubview(mapLable)
        view.addSubview(mapOutLit)
    
        
        NSLayoutConstraint.activate([
            
            
            mapLable.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor ,constant: 20),
            mapLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            mapOutLit.topAnchor.constraint(equalTo:mapLable.bottomAnchor ,constant: 10),
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
