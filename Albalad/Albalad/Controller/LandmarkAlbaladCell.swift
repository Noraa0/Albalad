//
//  LandmarkAlbaladCell.swift
//  Albalad
//
//  Created by Nora on 13/06/1443 AH.
//

import UIKit

class LandmarkAlbaladCell: UITableViewCell {

    
    static let id = "landmarkCell"
    
    
    
    var landmarkView : UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOffset = CGSize(width: 5, height: 5)
        $0.layer.shadowOpacity = 0.7
        $0.layer.shadowRadius = 10.0
        return $0
    }(UIView())
    
    var landmarkImg: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        return $0
    }(UIImageView())
    
    let landmarkName: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
        $0.textAlignment = .right
        $0.numberOfLines = 0
        $0.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return $0
    }(UILabel())
    
    
    let landmarkDes: UITextView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
        $0.textAlignment = .right
        $0.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        $0.isEditable = false
        return $0
    }(UITextView())
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    
    private func setupView() {
        
   
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        
        contentView.addSubview(landmarkView)
        landmarkView.addSubview(landmarkImg)
        contentView.addSubview(landmarkName)
        contentView.addSubview(landmarkDes)
        
        
        NSLayoutConstraint.activate([
            
            landmarkView.topAnchor.constraint(equalTo: topAnchor),
            landmarkView.trailingAnchor.constraint(equalTo: trailingAnchor),
            landmarkView.leadingAnchor.constraint(equalTo: leadingAnchor),
            landmarkView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            landmarkImg.topAnchor.constraint(equalTo: landmarkView.topAnchor),
            landmarkImg.trailingAnchor.constraint(equalTo: landmarkView.trailingAnchor),
            landmarkImg.leadingAnchor.constraint(equalTo: landmarkView.leadingAnchor),
            
            landmarkImg.heightAnchor.constraint(equalToConstant: 200),
            
            landmarkName.topAnchor.constraint(equalTo: landmarkImg.bottomAnchor, constant: 20),
            landmarkName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            landmarkDes.topAnchor.constraint(equalTo: landmarkName.bottomAnchor, constant: 5),
            landmarkDes.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 5),
            landmarkDes.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            landmarkDes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            landmarkDes.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            
        ])
    }
}
