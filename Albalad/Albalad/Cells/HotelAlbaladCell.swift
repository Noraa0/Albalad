//
//  HotelAlbaladCell.swift
//  Albalad
//
//  Created by Nora on 02/06/1443 AH.
//

import UIKit

class HotelAlbaladCell: UITableViewCell {
    
    static let id = "hotelCell"
    
    lazy var hotelImg: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    let hotelName: UILabel = {
        $0.textColor = .black
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
//    let hotelEmail : UILabel = {
//        $0.textColor = .black
//        $0.numberOfLines = 0
//        $0.textAlignment = .left
//        $0.font = UIFont.systemFont(ofSize: 13, weight: .regular)
//        return $0
//    }(UILabel())
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    private func setupView() {
        self.backgroundColor = .systemGray6
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
   
        contentView.addSubview(hotelImg)
        contentView.addSubview(hotelName)
//        contentView.addSubview(storeEmail)
        
        NSLayoutConstraint.activate([
            hotelImg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            hotelImg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            hotelImg.heightAnchor.constraint(equalToConstant: 25),
            hotelImg.widthAnchor.constraint(equalToConstant: 25),
            hotelName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            hotelName.leadingAnchor.constraint(equalTo: hotelImg.trailingAnchor, constant: 10),
            hotelName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//            storeEmail.topAnchor.constraint(equalTo: hotelName.bottomAnchor, constant: 10),
//            storeEmail.leadingAnchor.constraint(equalTo: hotelImg.trailingAnchor, constant: 10),
//            storeEmail.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
}


