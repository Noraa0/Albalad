//
//  MuseumAlbaladCell.swift
//  Albalad
//
//  Created by Nora on 30/05/1443 AH.
//

import UIKit

class MuseumAlbaladCell: UITableViewCell {
    
    static let id = "museumCell"
    
    lazy var museumImg: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    let museumName: UILabel = {
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
        
        contentView.addSubview(museumImg)
        contentView.addSubview(museumName)
        //        contentView.addSubview(storeEmail)
        
        NSLayoutConstraint.activate([
            museumImg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            museumImg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            museumImg.heightAnchor.constraint(equalToConstant: 25),
            museumImg.widthAnchor.constraint(equalToConstant: 25),
            museumName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            museumName.leadingAnchor.constraint(equalTo: museumImg.trailingAnchor, constant: 10),
            museumName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            //            storeEmail.topAnchor.constraint(equalTo: hotelName.bottomAnchor, constant: 10),
            //            storeEmail.leadingAnchor.constraint(equalTo: hotelImg.trailingAnchor, constant: 10),
            //            storeEmail.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
}



