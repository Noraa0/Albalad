//
//  ExplorCVCell.swift
//  Albalad
//
//  Created by Nora on 02/06/1443 AH.
//

import UIKit

class ExplorCVCell: UICollectionViewCell {

    static let identifier = "explorCell"

    var explorImg: UIImageView = {
           $0.contentMode = .scaleAspectFit
//           $0.layer.shadowColor = UIColor.lightGray.cgColor
//           $0.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
//           $0.layer.cornerRadius = 20
//           $0.layer.shadowRadius = 25.0
//           $0.layer.shadowOpacity = 0.9
//           $0.image = UIImage(systemName: "heart")
           
           $0.image?.withTintColor(.red)
           $0.clipsToBounds = true
           $0.translatesAutoresizingMaskIntoConstraints = false
           return $0
       }(UIImageView())
  
    
    var explorLable: UILabel = {
        $0.textColor = .black
        $0.text = "cell"
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        self.contentView.addSubview(explorImg)
        explorImg.addSubview(explorLable)

        
        NSLayoutConstraint.activate([
        explorImg.topAnchor
                .constraint(equalTo: self.contentView.topAnchor),
        explorImg.leftAnchor
                .constraint(equalTo: self.contentView.leftAnchor),
        explorImg.rightAnchor
                .constraint(equalTo: self.contentView.rightAnchor),
        explorImg.bottomAnchor
                .constraint(equalTo: self.contentView.bottomAnchor),

        explorLable.bottomAnchor.constraint(equalTo: explorImg.bottomAnchor),
        explorLable.leadingAnchor.constraint(equalTo: explorImg.centerXAnchor),
    


        ])
    }
   
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
