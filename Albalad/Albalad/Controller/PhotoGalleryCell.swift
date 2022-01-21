//
//  PhotoGalleryCell.swift
//  Albalad
//
//  Created by Nora on 17/06/1443 AH.
//

import UIKit


class PhotoGalleryCell: UICollectionViewCell {

    static let identifier = "PhotoGalleryCell"
    

    var view : UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOffset = CGSize(width: 5, height: 5)
        $0.layer.shadowOpacity = 0.7
        $0.layer.shadowRadius = 10.0
        return $0
    }(UIView())
    
    var Img: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        
        return $0
    }(UIImageView())
    
    
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(view)
        view.addSubview(Img)
       
        
        NSLayoutConstraint.activate([
            
            view.topAnchor.constraint(equalTo: contentView.topAnchor),
            view.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            view.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            Img.topAnchor.constraint(equalTo: view.topAnchor),
            Img.leftAnchor.constraint(equalTo: view.leftAnchor),
            Img.rightAnchor.constraint(equalTo: view.rightAnchor),
            Img.bottomAnchor.constraint(equalTo: view.bottomAnchor)

        
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
