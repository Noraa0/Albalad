//
//  ReservationVC.swift
//  Albalad
//
//  Created by Nora on 14/06/1443 AH.
//

import UIKit
import Firebase

class ReservationVC: UIViewController {

    
    var reservLable: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "الحجوزات"
        $0.font = UIFont(name: "GillSans-Italic", size: 25)
        $0.textColor = .black
        return $0
    }(UILabel())
    
    
    var reservView : UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOffset = CGSize(width: 5, height: 5)
        $0.layer.shadowOpacity = 0.7
        $0.layer.shadowRadius = 10.0
        return $0
    }(UIView())
    
    
    var reservHBtn : UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("حجز فندق", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = #colorLiteral(red: 0.2183634341, green: 0.4241205454, blue: 0.4433012903, alpha: 0.5)
        $0.layer.cornerRadius = 10
        $0.tag = 1
        $0.addTarget(self, action: #selector (reservedBtn), for: .touchDown)
        return $0
    }(UIButton())
    
    var reservMBtn : UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("حجز متحف", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = #colorLiteral(red: 0.2183634341, green: 0.4241205454, blue: 0.4433012903, alpha: 0.5)
        $0.layer.cornerRadius = 10
        $0.tag = 2
        $0.addTarget(self, action: #selector (reservedBtn), for: .touchDown)
        return $0
    }(UIButton())
    
    var reservEBtn : UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("حجز فعالية", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = #colorLiteral(red: 0.2183634341, green: 0.4241205454, blue: 0.4433012903, alpha: 0.5)
        $0.layer.cornerRadius = 10
        $0.tag = 3
        $0.addTarget(self, action: #selector (reservedBtn), for: .touchDown)
        return $0
    }(UIButton())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setUp()
    }
    
    
    func setUp() {
        
        view.addSubview(reservLable)
        view.addSubview(reservView)
        reservView.addSubview(reservHBtn)
        reservView.addSubview(reservMBtn)
        reservView.addSubview(reservEBtn)
        
        
        NSLayoutConstraint.activate([
            
            reservLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            reservLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            reservLable.heightAnchor.constraint(equalToConstant: 30),
//          reservLable.widthAnchor.constraint(equalToConstant: 200),
            
            reservView.topAnchor.constraint(equalTo: reservLable.bottomAnchor, constant: 90),
            reservView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            reservView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            reservView.heightAnchor.constraint(equalToConstant: 300),
            
            reservHBtn.topAnchor.constraint(equalTo: reservView.topAnchor,constant: 10),
            reservHBtn.centerXAnchor.constraint(equalTo: reservView.centerXAnchor),
            reservHBtn.widthAnchor.constraint(equalToConstant: 250),
            reservHBtn.heightAnchor.constraint(equalToConstant: 80),
            
            reservMBtn.topAnchor.constraint(equalTo: reservHBtn.bottomAnchor,constant: 10),
            reservMBtn.centerXAnchor.constraint(equalTo: reservView.centerXAnchor),
            reservMBtn.widthAnchor.constraint(equalToConstant: 250),
            reservMBtn.heightAnchor.constraint(equalToConstant: 80),
            
         
            reservEBtn.topAnchor.constraint(equalTo: reservMBtn.bottomAnchor,constant: 10),
            reservEBtn.centerXAnchor.constraint(equalTo: reservView.centerXAnchor),
            reservEBtn.widthAnchor.constraint(equalToConstant: 250),
            reservEBtn.heightAnchor.constraint(equalToConstant: 80),
     

        
        ])

    

}
    
    @objc func reservedBtn(_ btn : UIButton) {
      
        if btn.tag == 1 {
            
            let vc = HotelsVC()
            present(vc, animated: true, completion: nil)
            
            
        }else if btn.tag == 2 {
            
            let vc = MuseumsVC()
            present(vc, animated: true, completion: nil)
            
        }else{
            
            let vc = LandmarkAlbaladVC()
            present(vc, animated: true, completion: nil)
        }
    }
 
}
