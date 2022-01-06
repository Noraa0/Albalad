//
//  MuseumDetailsVC.swift
//  Albalad
//
//  Created by Nora on 02/06/1443 AH.
//

import UIKit

class MuseumDetailsVC: UIViewController {

    var nameView : UIView = {
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 15
        $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
    }(UIView())
    
    
    var museumName : UILabel = {
        $0.textColor = .black
        $0.text = "اسم المتحف"
        $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
    }(UILabel())
    
    
    var descriptionView : UIView = {
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 15
        $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
    }(UIView())
    
    var museumDescription : UILabel = {
        $0.textColor = .black
        $0.text = "وصف المتحف"
        $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
    }(UILabel())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(nameView)
        nameView.addSubview(museumName)
        view.addSubview(descriptionView)
        descriptionView.addSubview(museumDescription)
        
        
        
        NSLayoutConstraint.activate([
            nameView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            nameView.heightAnchor.constraint(equalToConstant: 100),
            nameView.leftAnchor.constraint(equalTo: view.leftAnchor , constant: 30),
            nameView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -30),
            
            museumName.topAnchor.constraint(equalTo: nameView.topAnchor , constant: 10),
            museumName.heightAnchor.constraint(equalToConstant: 30),
            museumName.trailingAnchor.constraint(equalTo: nameView.trailingAnchor),
            museumName.widthAnchor.constraint(equalToConstant: 100),
            
            
            descriptionView.topAnchor.constraint(equalTo: nameView.bottomAnchor, constant: 20),
            descriptionView.heightAnchor.constraint(equalToConstant: 300),
            descriptionView.leftAnchor.constraint(equalTo: view.leftAnchor , constant: 30),
            descriptionView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -30),
            
            museumDescription.topAnchor.constraint(equalTo: descriptionView.topAnchor , constant: 10),
            museumDescription.heightAnchor.constraint(equalToConstant: 30),
            museumDescription.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor),
            museumDescription.widthAnchor.constraint(equalToConstant: 100),
            
        ])
    }

}
