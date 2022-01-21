//
//  ToursCell.swift
//  Albalad
//
//  Created by Nora on 14/06/1443 AH.
//

import UIKit

class ToursCell: UITableViewCell {

    static let id = "ToursCell"
    
    
    
    var tourView : UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOffset = CGSize(width: 5, height: 5)
        $0.layer.shadowOpacity = 0.7
        $0.layer.shadowRadius = 10.0
        return $0
    }(UIView())
    
    var tourImg: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.frame.size = CGSize(width: 50, height: 50)
        $0.layer.cornerRadius = $0.frame.width/2
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    let tourName: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
        $0.textAlignment = .right
        $0.numberOfLines = 0
        $0.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return $0
    }(UILabel())
    

    
    var tourDes: UITextView = {
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
        
        contentView.addSubview(tourImg)
        contentView.addSubview(tourName)
        contentView.addSubview(tourDes)
        
        
        NSLayoutConstraint.activate([
            

            
            tourImg.topAnchor.constraint(equalTo: contentView.topAnchor ,constant: 20),
            tourImg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor , constant: -20),
            tourImg.heightAnchor.constraint(equalToConstant: 50),
            tourImg.widthAnchor.constraint(equalToConstant: 50),
            
            tourName.topAnchor.constraint(equalTo: contentView.topAnchor ,constant: 40),
            tourName.trailingAnchor.constraint(equalTo: tourImg.leadingAnchor, constant: -20),
            tourName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            tourName.widthAnchor.constraint(equalToConstant: 80),
            tourName.heightAnchor.constraint(equalToConstant: 20),
            
            
            tourDes.topAnchor.constraint(equalTo: tourName.bottomAnchor, constant: 10),
            tourDes.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 5),
            tourDes.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tourDes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tourDes.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
            
            
        ])
    }
}

