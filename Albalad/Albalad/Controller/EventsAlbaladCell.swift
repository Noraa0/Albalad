//
//  EventsAlbaladCell.swift
//  Albalad
//
//  Created by Nora on 16/06/1443 AH.
//

import UIKit

class EventsAlbaladCell: UITableViewCell {

    
    static let id = "EventsAlbaladCell"
    
    
    
    var eventView : UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOffset = CGSize(width: 5, height: 5)
        $0.layer.shadowOpacity = 0.7
        $0.layer.shadowRadius = 10.0
        return $0
    }(UIView())
    
    var eventImg: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        return $0
    }(UIImageView())
    
    let eventName: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
        $0.textAlignment = .right
        $0.numberOfLines = 0
        $0.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return $0
    }(UILabel())
    
    
    let eventDes: UITextView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
        $0.textAlignment = .right
        $0.backgroundColor = .clear
        $0.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        $0.isEditable = false
        return $0
    }(UITextView())
    
    var eventPrice: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .right
        $0.textColor = .black
        $0.numberOfLines = 0
        $0.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return $0
    }(UILabel())
    
    var reservLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "اضغط للحجز" 
        $0.textAlignment = .right
        $0.textColor = .black
        $0.numberOfLines = 0
        $0.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return $0
    }(UILabel())
    
    
    
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
        
        contentView.addSubview(eventView)
        eventView.addSubview(eventImg)
        contentView.addSubview(eventName)
        contentView.addSubview(eventDes)
        contentView.addSubview(reservLabel)
        contentView.addSubview(eventPrice)
        
        
        NSLayoutConstraint.activate([
            
            eventView.topAnchor.constraint(equalTo: topAnchor),
            eventView.trailingAnchor.constraint(equalTo: trailingAnchor),
            eventView.leadingAnchor.constraint(equalTo: leadingAnchor),
            eventView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            eventImg.topAnchor.constraint(equalTo: eventView.topAnchor),
            eventImg.trailingAnchor.constraint(equalTo: eventView.trailingAnchor),
            eventImg.leadingAnchor.constraint(equalTo: eventView.leadingAnchor),
            eventImg.heightAnchor.constraint(equalToConstant: 200),
            
            eventName.topAnchor.constraint(equalTo: eventImg.bottomAnchor, constant: 10),
            eventName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            eventDes.topAnchor.constraint(equalTo: eventName.bottomAnchor, constant: 5),
            eventDes.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            eventDes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            eventDes.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            reservLabel.topAnchor.constraint(equalTo: eventDes.bottomAnchor, constant: 5),
            reservLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10),
            reservLabel.heightAnchor.constraint(equalToConstant: 30),
            reservLabel.widthAnchor.constraint(equalToConstant: 100),
            reservLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50),

            eventPrice.topAnchor.constraint(equalTo: eventDes.bottomAnchor, constant: 5),
            eventPrice.leadingAnchor.constraint(equalTo: reservLabel.leadingAnchor,constant: -120),
            eventPrice.heightAnchor.constraint(equalToConstant: 30),
            eventPrice.widthAnchor.constraint(equalToConstant: 100),
            eventPrice.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50),

            
            
            
        ])
    }
}
