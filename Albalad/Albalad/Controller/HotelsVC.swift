//
//  HotelsVC.swift
//  Albalad
//
//  Created by Nora on 02/06/1443 AH.
//

import UIKit
import Firebase

class HotelsVC: UIViewController {
    

     let user = Auth.auth().currentUser
    
    var hotelArray = [Hotel(name: "فندق برايم", hotelImg: UIImage(named: "فندق١")!, price: "٤٣٠ ريال", description: "فندق بإطلالة رائعة"),
                      Hotel(name: "الفندق الذهبي", hotelImg: UIImage(named: "الفندق الذهبي")!, price: "٢٠٨ ريال", description: "فندق بإطلالة رائعة"),
                      Hotel(name: "فندق النهضة", hotelImg: UIImage(named: "فندق١")!, price: "١٣٩ ريال", description: "فندق بإطلالة رائعة"),
                      Hotel(name: "فندق توق بلد", hotelImg: UIImage(named: "فندق توق البلد")!, price: "١٣٩ ريال", description: "فندق بإطلالة رائعة")
                      
    ]
    
    var hoteleName = ""
  
    

    var hotelLable: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "الفنادق"
        $0.font = UIFont(name: "GillSans-Italic", size: 25)
        $0.textColor = .black
        return $0
    }(UILabel())
    
    lazy var tableView : UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(HotelAlbaladCell.self, forCellReuseIdentifier: HotelAlbaladCell.id)
        $0.estimatedRowHeight = 200
        $0.delegate = self
        $0.dataSource = self
        $0.layer.cornerRadius = 10
        return $0
    }(UITableView())
    
    var backButton : UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(systemName: "chevron.forward.square.fill"), for: .normal)
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector (backBtn), for: .touchDown)
        return $0
    }(UIButton())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUp()
    }
    
    func setUp(){
        
        view.addSubview(hotelLable)
        view.addSubview(tableView)
        view.addSubview(backButton)
    
        NSLayoutConstraint.activate([
            
            hotelLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            hotelLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: hotelLable.bottomAnchor, constant: 30),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20),
            backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -15)
        ])
    }
    
    @objc func backBtn() {
        dismiss(animated: true)
    }
    

}
extension HotelsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotelArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HotelAlbaladCell.id, for: indexPath) as! HotelAlbaladCell
        cell.hotelName.text = hotelArray[indexPath.row].name
        cell.hotelImg.image = hotelArray[indexPath.row].hotelImg
        cell.hotelPrice.text = hotelArray[indexPath.row].price
        cell.hotelDes.text = hotelArray[indexPath.row].description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = HotelReservationVC()
        vc.hotelNameSelected = indexPath.row
        present(vc, animated: true, completion: nil)
    }
}


