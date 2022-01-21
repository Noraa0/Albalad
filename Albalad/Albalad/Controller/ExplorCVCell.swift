//
//  ExplorCVCell.swift
//  Albalad
//
//  Created by Nora on 02/06/1443 AH.
//

import UIKit

class ExplorCVCell: UICollectionViewCell {
    
    static let identifier = "explorCell"
    
    
    
    var view : UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOffset = CGSize(width: 5, height: 5)
        $0.layer.shadowOpacity = 0.7
        $0.layer.shadowRadius = 10.0
        return $0
    }(UIView())
    
    var explorImg: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        
        return $0
    }(UIImageView())
    
    
    var explorLable: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
        $0.text = "cell"
        return $0
    }(UILabel())
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(view)
        view.addSubview(explorImg)
        contentView.addSubview(explorLable)
        
        
        NSLayoutConstraint.activate([
            
            view.topAnchor.constraint(equalTo: contentView.topAnchor),
            view.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            view.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            explorImg.topAnchor.constraint(equalTo: view.topAnchor),
            explorImg.leftAnchor.constraint(equalTo: view.leftAnchor),
            explorImg.rightAnchor.constraint(equalTo: view.rightAnchor),
            explorImg.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            explorLable.topAnchor.constraint(equalTo: explorImg.bottomAnchor , constant: 5),
            explorLable.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            
            
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
