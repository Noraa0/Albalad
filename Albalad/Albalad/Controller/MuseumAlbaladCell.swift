//
//  MuseumAlbaladCell.swift
//  Albalad
//
//  Created by Nora on 02/06/1443 AH.
//

import UIKit

class MuseumAlbaladCell: UITableViewCell {
    
    static let id = "museumCell"
    
    
    
    lazy var museumImg: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20
        return $0
    }(UIImageView())
    
    var museumView : UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOffset = CGSize(width: 5, height: 5)
        $0.layer.shadowOpacity = 0.7
        $0.layer.shadowRadius = 10.0
        return $0
    }(UIView())
    
    let museumName: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return $0
    }(UILabel())
    
    let museumDes: UITextView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
        $0.textAlignment = .right
        $0.backgroundColor = .clear
        $0.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        $0.isEditable = false
        return $0
    }(UITextView())
    
    var museumPrice: UILabel = {
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
        
    
        
        self.backgroundColor = #colorLiteral(red: 0.880281508, green: 0.8669131398, blue: 0.8231617808, alpha: 1)
        self.layer.cornerRadius = 5
        self.clipsToBounds = true

        
        contentView.addSubview(museumView)
        museumView.addSubview(museumImg)
        contentView.addSubview(museumName)
        contentView.addSubview(museumDes)
        contentView.addSubview(reservLabel)
        contentView.addSubview(museumPrice)
        
        
        NSLayoutConstraint.activate([

            museumView.topAnchor.constraint(equalTo: topAnchor),
            museumView.trailingAnchor.constraint(equalTo: trailingAnchor),
            museumView.leadingAnchor.constraint(equalTo: leadingAnchor),
            museumView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            museumImg.topAnchor.constraint(equalTo: museumView.topAnchor),
            museumImg.trailingAnchor.constraint(equalTo: museumView.trailingAnchor),
            museumImg.leadingAnchor.constraint(equalTo: museumView.leadingAnchor),
            museumImg.heightAnchor.constraint(equalToConstant: 200),
            
            museumName.topAnchor.constraint(equalTo: museumImg.bottomAnchor, constant: 10),
            museumName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            museumDes.topAnchor.constraint(equalTo: museumName.bottomAnchor, constant: 5),
            museumDes.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            museumDes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            museumDes.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            reservLabel.topAnchor.constraint(equalTo: museumDes.bottomAnchor, constant: 5),
            reservLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10),
            reservLabel.heightAnchor.constraint(equalToConstant: 30),
            reservLabel.widthAnchor.constraint(equalToConstant: 100),
            reservLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50),

            museumPrice.topAnchor.constraint(equalTo: museumDes.bottomAnchor, constant: 5),
            museumPrice.leadingAnchor.constraint(equalTo: reservLabel.leadingAnchor,constant: -120),
            museumPrice.heightAnchor.constraint(equalToConstant: 30),
            museumPrice.widthAnchor.constraint(equalToConstant: 100),
            museumPrice.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50),

            
            
            
        ])
    }
}



