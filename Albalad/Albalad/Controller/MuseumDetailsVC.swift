//
//  MuseumDetailsVC.swift
//  Albalad
//
//  Created by Nora on 02/06/1443 AH.
//

import UIKit

class MuseumDetailsVC: UIViewController {
    
    var vc = MuseumsVC()
    var museumNameSelected : Int?
    
    
    
    var nameView : UIView = {
        $0.backgroundColor = UIColor(named: "Color")
        $0.layer.cornerRadius = 15
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    
    
    var museumName : UILabel = {
        $0.textColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    
    var descriptionView : UIView = {
        $0.backgroundColor = UIColor(named: "Color")
        $0.layer.cornerRadius = 15
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    
    var museumDescription : UITextView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
        $0.backgroundColor = .clear
        $0.textAlignment = .right
        $0.isEditable = false
        return $0
    }(UITextView())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if museumNameSelected == 0 {
            museumName.text = "بيت البلد"
            museumDescription.text = "هو بيت لعائلة آل باجنيد وقد سكنته السفارة البريطانية كما سكنته مديرية الشرطة إبان مديرها عبدالمجيد شبكشي"
        }else if museumNameSelected == 1 {
            museumName.text = "بيت نصيف"
            museumDescription.text = "بيت الأفندي محمد حسين نصيف وأولاده التاريخي بني عام 1281هـ وهو يقع في حارة اليمن بناه الجد الأكبر عمر نصيف وقد صممه مهندس يدعى سرسار واستمر العمل به سبع سنوات وأقام فيه الملك عبدالعزيز واتخذه سكنًا مؤقتًا له عند دخوله جدة"
        }else if museumNameSelected == 2 {
            museumName.text = "بيت باعشن"
            museumDescription.text = "dddldl"
        }else if museumNameSelected == 3 {
            museumName.text = "بيت سليمان قابل"
            museumDescription.text = "hhhh"
        }
        
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
            museumDescription.heightAnchor.constraint(equalToConstant: 200),
            museumDescription.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor),
            museumDescription.widthAnchor.constraint(equalToConstant: 200),
            
        ])
    }
    
}
