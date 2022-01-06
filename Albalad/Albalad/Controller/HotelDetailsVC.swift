//
//  HotelDetailsVC.swift
//  Albalad
//
//  Created by Nora on 02/06/1443 AH.
//

import UIKit

class HotelDetailsVC: UIViewController {

   
    var nameView : UIView = {
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 15
        $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
    }(UIView())
    
    
    var hotelName : UILabel = {
        $0.textColor = .black
        $0.text = "اسم الفندق"
        $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
    }(UILabel())
    
    
    var descriptionView : UIView = {
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 15
        $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
    }(UIView())
    
    var hotelDescription : UILabel = {
        $0.textColor = .black
        $0.text = "وصف الفندق"
        $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
    }(UILabel())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(nameView)
        nameView.addSubview(hotelName)
        view.addSubview(descriptionView)
        descriptionView.addSubview(hotelDescription)
        
        
        
        NSLayoutConstraint.activate([
            nameView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            nameView.heightAnchor.constraint(equalToConstant: 100),
            nameView.leftAnchor.constraint(equalTo: view.leftAnchor , constant: 30),
            nameView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -30),
            
            hotelName.topAnchor.constraint(equalTo: nameView.topAnchor , constant: 10),
            hotelName.heightAnchor.constraint(equalToConstant: 30),
            hotelName.trailingAnchor.constraint(equalTo: nameView.trailingAnchor),
            hotelName.widthAnchor.constraint(equalToConstant: 100),
            
            
            descriptionView.topAnchor.constraint(equalTo: nameView.bottomAnchor, constant: 20),
            descriptionView.heightAnchor.constraint(equalToConstant: 300),
            descriptionView.leftAnchor.constraint(equalTo: view.leftAnchor , constant: 30),
            descriptionView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -30),
            
            hotelDescription.topAnchor.constraint(equalTo: descriptionView.topAnchor , constant: 10),
            hotelDescription.heightAnchor.constraint(equalToConstant: 30),
            hotelDescription.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor),
            hotelDescription.widthAnchor.constraint(equalToConstant: 100),
            
        ])
    }

}
