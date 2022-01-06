//
//  AlbaladMapVC.swift
//  Albalad
//
//  Created by Nora on 02/06/1443 AH.
//

import UIKit

//CLLocationManagerDelegate, GMSMapViewDelegate

class AlbaladMapVC: UIViewController{


//        let myLocation = CLLocationManager()
        var pin = UIImageView()
        var newBtn = UIButton()
        
        var locationLable: UILabel = {
            $0.text = "الموقع"
            $0.textAlignment = .center
            $0.textColor = .black
            $0.translatesAutoresizingMaskIntoConstraints = false
            return $0
        }(UILabel())
        
        
//        var mapView : GMSMapView = {
//          $0.translatesAutoresizingMaskIntoConstraints = false
//          $0.backgroundColor = .white
//          return $0
//        }(GMSMapView())


    //    var mapPin : UIPinchGestureRecognizer
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
//            myLocation.delegate = self
//            myLocation.requestWhenInUseAuthorization()
//            myLocation.stopUpdatingLocation()
//
//            mapView.isMyLocationEnabled = true
//            mapView.settings.myLocationButton = true
//
//
//            view.addSubview(mapView)
            view.addSubview(locationLable)
            
            
            NSLayoutConstraint.activate([
//                mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
//                mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor , constant: -10),
//                mapView.leftAnchor.constraint(equalTo: view.leftAnchor),
//                mapView.rightAnchor.constraint(equalTo: view.rightAnchor),
                
                locationLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 400),
                locationLable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                locationLable.leftAnchor.constraint(equalTo: view.leftAnchor),
                locationLable.rightAnchor.constraint(equalTo: view.rightAnchor)
            ])
            
        }
        
        
        
//        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//
//            if let location = locations.last {
//                let latidude = location.coordinate.latitude
//                let longitude = location.coordinate.longitude
//                let camera = GMSCameraPosition(latitude: latidude, longitude: longitude, zoom: 20.0)
//
//                self.mapView.animate(to: camera)
//            }
//        }
        
    //    func reverseGeocodeLocation(coordinate: CLLocationCoordinate2D) {
    //
    //        //1 - Creating and intiating GMSGeocoder Object to be
    //
    //        let geocoder = GMSGeocoder()
    //        //2 - use geocoder to reverse geocode the coordinates
    //
    //        geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
    //
    //            if let address = response?.firstResult(),
    //                let lines = address.lines {
    //
    //                //3 - setting coordinatesAddressLabel text to current coordinates address
    //
    //                print(lines.joined(separator: "\n") )
    //                self.coordinatesAddressLabel.text = lines.joined(separator: "\n")
    //            }
    //        }
    //    }

    }

