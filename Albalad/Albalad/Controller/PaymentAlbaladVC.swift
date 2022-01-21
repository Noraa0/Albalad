//
//  PaymentAlbaladVC.swift
//  Albalad
//
//  Created by Nora on 02/06/1443 AH.
//

import UIKit
import Firebase

class PaymentAlbaladVC: UIViewController {
    
    let db = Firestore.firestore()
    let userID = Auth.auth().currentUser?.uid
    
    var resArray = [Reservation]()
    
    
    var cardInfo: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
        $0.text = "بيانات البطاقة"
        $0.font = UIFont(name: "GillSans-Italic", size: 25)
        $0.textColor = .black
        $0.numberOfLines = 1
        return $0
    }(UILabel())
    
    var infoView : UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = #colorLiteral(red: 0.2183634341, green: 0.4241205454, blue: 0.4433012903, alpha: 0.2)
        $0.layer.cornerRadius = 15
        return $0
    }(UIView())
    
    var nameRes: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
        $0.font = UIFont(name: "GillSans-Italic", size: 15)
        $0.textColor = .black
        $0.numberOfLines = 1
        return $0
    }(UILabel())
    
    var dateRes: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
        $0.font = UIFont(name: "GillSans-Italic", size: 15)
        $0.textColor = .black
        $0.numberOfLines = 1
        return $0
    }(UILabel())
    
    var timeRes: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
        $0.font = UIFont(name: "GillSans-Italic", size: 15)
        $0.textColor = .black
        $0.numberOfLines = 1
        return $0
    }(UILabel())
    
    var priceRes: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
        $0.font = UIFont(name: "GillSans-Italic", size: 15)
        $0.textColor = .black
        $0.numberOfLines = 1
        return $0
    }(UILabel())
    
    var cardView : UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = #colorLiteral(red: 0.2183634341, green: 0.4241205454, blue: 0.4433012903, alpha: 0.2)
        $0.layer.cornerRadius = 15
        return $0
    }(UIView())
    
    var cardNum: UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.placeholder = "ادخل رقم البطاقة"
        $0.borderStyle = .roundedRect
        $0.textColor = .black
        return $0
    }(UITextField())
    
    var dateEx: UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.placeholder = "ادخل تاريخ الانتهاء"
        $0.borderStyle = .roundedRect
        $0.textColor = .black
        return $0
    }(UITextField())
    
    var passNum: UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.placeholder = "ادخل الرقم السري"
        $0.isSecureTextEntry = true
        $0.borderStyle = .roundedRect
        $0.textColor = .black
        return $0
    }(UITextField())
    
    
    var payBtn : UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("الدفع", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = #colorLiteral(red: 0.2183634341, green: 0.4241205454, blue: 0.4433012903, alpha: 0.5)
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector (payedBtn), for: .touchDown)
        return $0
    }(UIButton())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
      
        loudData()
        setUp()
    }
    
    
    func setUp() {
        
        view.addSubview(cardInfo)
        view.addSubview(infoView)
        infoView.addSubview(nameRes)
        infoView.addSubview(dateRes)
        infoView.addSubview(timeRes)
        infoView.addSubview(priceRes)

        
        view.addSubview(cardView)
        view.addSubview(payBtn)
        cardView.addSubview(cardNum)
        cardView.addSubview(dateEx)
        cardView.addSubview(passNum)

        
        
        NSLayoutConstraint.activate([
            
            cardInfo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            cardInfo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardInfo.heightAnchor.constraint(equalToConstant: 30),
            
            infoView.topAnchor.constraint(equalTo: cardInfo.bottomAnchor, constant: 40),
            infoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            infoView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            infoView.heightAnchor.constraint(equalToConstant: 280),

            nameRes.topAnchor.constraint(equalTo: infoView.topAnchor,constant: 30),
            nameRes.centerXAnchor.constraint(equalTo: infoView.centerXAnchor),
            nameRes.widthAnchor.constraint(equalToConstant: 280),
            nameRes.heightAnchor.constraint(equalToConstant: 30),

            dateRes.topAnchor.constraint(equalTo: nameRes.bottomAnchor,constant: 30),
            dateRes.centerXAnchor.constraint(equalTo: infoView.centerXAnchor),
            dateRes.widthAnchor.constraint(equalToConstant: 280),
            dateRes.heightAnchor.constraint(equalToConstant: 30),
            
            timeRes.topAnchor.constraint(equalTo: dateRes.bottomAnchor,constant: 30),
            timeRes.centerXAnchor.constraint(equalTo: infoView.centerXAnchor),
            timeRes.widthAnchor.constraint(equalToConstant: 280),
            timeRes.heightAnchor.constraint(equalToConstant: 30),
            
            priceRes.topAnchor.constraint(equalTo: timeRes.bottomAnchor,constant: 30),
            priceRes.centerXAnchor.constraint(equalTo: infoView.centerXAnchor),
            priceRes.widthAnchor.constraint(equalToConstant: 280),
            priceRes.heightAnchor.constraint(equalToConstant: 30),
            
            cardView.topAnchor.constraint(equalTo: infoView.bottomAnchor, constant: 40),
            cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            cardView.heightAnchor.constraint(equalToConstant: 200),

            cardNum.topAnchor.constraint(equalTo: cardView.topAnchor,constant: 30),
            cardNum.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            cardNum.widthAnchor.constraint(equalToConstant: 280),
            cardNum.heightAnchor.constraint(equalToConstant: 30),

            dateEx.topAnchor.constraint(equalTo: cardNum.bottomAnchor,constant: 30),
            dateEx.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            dateEx.widthAnchor.constraint(equalToConstant: 280),
            dateEx.heightAnchor.constraint(equalToConstant: 30),
            
            passNum.topAnchor.constraint(equalTo: dateEx.bottomAnchor,constant: 30),
            passNum.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            passNum.widthAnchor.constraint(equalToConstant: 280),
            passNum.heightAnchor.constraint(equalToConstant: 30),
            
            payBtn.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 40),
            payBtn.heightAnchor.constraint(equalToConstant: 50),
            payBtn.widthAnchor.constraint(equalToConstant: 100),
            payBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
         ])
    }
    

    
    func loudData(){
               if let userID = userID {
                   db.collection("User").document(userID)
                       .getDocument {
                           qurSnapShot, error in
                           if let error = error {
                               print(error.localizedDescription)
                           } else {
                               
                               self.db.collection("Reservation").document(Auth.auth().currentUser!.uid).addSnapshotListener { documentSnapshot, error in
                                   if let error = error{
                                       print(error)
                                   }else{
                                       let name = documentSnapshot?.get("name") as? String ?? ""
                                       let date = documentSnapshot?.get("time") as? String ?? ""
                                       let time = documentSnapshot?.get("date")  as? String ?? ""
                                       let price = documentSnapshot?.get("price")  as? String ?? ""
                                       
                                       self.nameRes.text = name
                                       self.dateRes.text = date
                                       self.timeRes.text = time
                                       self.priceRes.text = price
                                   }
                               }
                           }
                       }
               }
           }



    
    func myCustomAlert(title :String , message : String , isAdd: Bool) {
         
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
         
        if isAdd{
           
          let action = UIAlertAction(title: "حسناً", style: .default) { action in
            
              let vc = ViewController()
              vc.modalPresentationStyle = .fullScreen
              self.present(vc, animated: true, completion: nil)
             
          }
            
            alert.addAction(action)
            
            self.present(alert, animated: true, completion: nil)

        }

      }
       
    
    @objc func payedBtn() {
        
        myCustomAlert(title: "نجاح", message: "تم الدفع بنجاح", isAdd: true)
    }
}
