//
//  HotelAlbaladCell.swift
//  Albalad
//
//  Created by Nora on 02/06/1443 AH.
//

import UIKit

class HotelAlbaladCell: UITableViewCell {
    
    static let id = "hotelCell"
    
    
    var hotelView : UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOffset = CGSize(width: 2, height: 2)
        $0.layer.shadowOpacity = 0.7
        $0.layer.shadowRadius = 10.0
        return $0
    }(UIView())
    
    var hotelImg: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    var hotelName: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .right
        $0.textColor = .black
        $0.numberOfLines = 1
        $0.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return $0
    }(UILabel())
    
    let hotelDes: UITextView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
        $0.textAlignment = .right
        $0.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        $0.backgroundColor = .clear
        $0.isEditable = false
        return $0
    }(UITextView())
    
    var hotelPrice: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .right
        $0.textColor = .black
        $0.numberOfLines = 0
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return $0
    }(UILabel())
    
    
    
    var hotelreserv: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .right
        $0.text = "اضغط للحجز"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
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
        
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        
        contentView.addSubview(hotelView)
        hotelView.addSubview(hotelImg)
        contentView.addSubview(hotelName)
        contentView.addSubview(hotelDes)
        contentView.addSubview(hotelPrice)
        contentView.addSubview(hotelreserv)
        
        NSLayoutConstraint.activate([

            hotelView.topAnchor.constraint(equalTo: topAnchor),
            hotelView.trailingAnchor.constraint(equalTo: trailingAnchor),
            hotelView.leadingAnchor.constraint(equalTo: leadingAnchor),
            hotelView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            hotelImg.topAnchor.constraint(equalTo: hotelView.topAnchor, constant: 40),
            hotelImg.trailingAnchor.constraint(equalTo: hotelName.leadingAnchor ,constant: -80),
            hotelImg.leadingAnchor.constraint(equalTo: hotelView.leadingAnchor),
            hotelImg.heightAnchor.constraint(equalToConstant: 250),
            
            hotelName.topAnchor.constraint(equalTo: hotelView.topAnchor,constant: 40),
            hotelName.leadingAnchor.constraint(equalTo: hotelImg.trailingAnchor,constant: 10),
            hotelName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            hotelName.heightAnchor.constraint(equalToConstant: 20),
            hotelName.widthAnchor.constraint(equalToConstant: 100),

            
            hotelDes.topAnchor.constraint(equalTo: hotelName.bottomAnchor,constant: 5),
            hotelDes.leadingAnchor.constraint(equalTo: hotelImg.trailingAnchor,constant: 10),
            hotelDes.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            hotelDes.heightAnchor.constraint(equalToConstant: 40),
            hotelDes.widthAnchor.constraint(equalToConstant: 100),
            
            hotelPrice.topAnchor.constraint(equalTo: hotelDes.bottomAnchor, constant: 5),
            hotelPrice.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            hotelPrice.leadingAnchor.constraint(equalTo: hotelImg.trailingAnchor, constant: 10),

            hotelreserv.topAnchor.constraint(equalTo: hotelPrice.bottomAnchor, constant: 5),
            hotelreserv.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            hotelreserv.leadingAnchor.constraint(equalTo: hotelImg.trailingAnchor, constant: 10),
            hotelreserv.bottomAnchor.constraint(equalTo: contentView.bottomAnchor , constant: -20)
            
            
        ])
    }
}


