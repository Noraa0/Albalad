//
//  EventAlbaladCell.swift
//  Albalad
//
//  Created by Nora on 02/06/1443 AH.
//

import UIKit

class EventAlbaladCell: UICollectionViewCell {
    
    static let identifier = "eventBCell"

    var eventImg: UIImageView = {
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
  
    
    var eventsBLable: UILabel = {
        $0.textColor = .black
        $0.text = "الفعاليات"
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        self.contentView.addSubview(eventImg)
        eventImg.addSubview(eventsBLable)

        
        NSLayoutConstraint.activate([
        eventImg.topAnchor
                .constraint(equalTo: self.contentView.topAnchor),
        eventImg.leftAnchor
                .constraint(equalTo: self.contentView.leftAnchor),
        eventImg.rightAnchor
                .constraint(equalTo: self.contentView.rightAnchor),
        eventImg.bottomAnchor
                .constraint(equalTo: self.contentView.bottomAnchor),

        eventsBLable.bottomAnchor.constraint(equalTo: eventImg.bottomAnchor),
        eventsBLable.leadingAnchor.constraint(equalTo: eventImg.centerXAnchor),
    


        ])
    }
   
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


