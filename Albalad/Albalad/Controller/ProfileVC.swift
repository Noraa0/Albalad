//
//  ProfileVC.swift
//  Albalad
//
//  Created by Nora on 14/06/1443 AH.
//

import UIKit
import Firebase

class ProfileVC: UIViewController {
    
    
    var userID = Auth.auth().currentUser?.uid
    
    var profileImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(systemName: "person.circle")
        $0.tintColor = #colorLiteral(red: 0.2183634341, green: 0.4241205454, blue: 0.4433012903, alpha: 0.5)
        $0.contentMode = .scaleAspectFill
        $0.frame.size = CGSize(width: 70, height: 70)
        $0.layer.cornerRadius = $0.frame.width/2
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    
    var nameLable: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .right
        $0.text = "ضيف"
        $0.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        $0.adjustsFontSizeToFitWidth = true
        $0.font = UIFont(name: "HelveticaNeue-Bold", size: 33)
        return $0
    }(UILabel())
    
    var emailLable: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
        return $0
    }(UILabel())
    
    let loginButton : UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("إنشاء حساب", for: .normal)
        $0.setTitleColor( #colorLiteral(red: 0.3786586225, green: 0.2085697949, blue: 0.1343922317, alpha: 1), for: .normal)
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector (login), for: .touchDown)
        return $0
    }(UIButton())
    
    
    
    let signOutBtn : UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(systemName: "rectangle.portrait.and.arrow.right"), for: .normal)
        $0.setTitle("تسجيل الخروج", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.tintColor = #colorLiteral(red: 0.2183634341, green: 0.4241205454, blue: 0.4433012903, alpha: 0.5)
        $0.layer.cornerRadius = 15
        $0.addTarget(self, action: #selector(signOut), for: .touchDown)
        return $0
    }(UIButton())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
      
        setUp()
        
        
        
    }
    
    func setUp() {
        
        view.addSubview(profileImage)
        view.addSubview(nameLable)
        view.addSubview(loginButton)
        view.addSubview(signOutBtn)
        
        NSLayoutConstraint.activate([
            
            profileImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            profileImage.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -20),
            profileImage.heightAnchor.constraint(equalToConstant: 100),
            profileImage.widthAnchor.constraint(equalToConstant: 100),
            
            
            nameLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 220),
            nameLable.trailingAnchor.constraint(equalTo: profileImage.leadingAnchor),
            nameLable.widthAnchor.constraint(equalToConstant: 80),
            nameLable.heightAnchor.constraint(equalToConstant: 20),
            
            loginButton.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: profileImage.trailingAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 150),
            loginButton.heightAnchor.constraint(equalToConstant: 20),
            
            signOutBtn.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            signOutBtn.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor),
            signOutBtn.widthAnchor.constraint(equalToConstant: 150),
            signOutBtn.heightAnchor.constraint(equalToConstant: 20),
            
        ])
    }
    
    
    
    @objc func login() {
        let vc = SignUpVC()
        present(vc, animated: true, completion: nil)
    }
    @objc func signOut() {
        let alert = UIAlertController(title: "", message: "هل انت متأكد من تسجيل الخروج؟", preferredStyle: .alert)
        let signOutBtn = UIAlertAction(title: "تسجيل خروج", style: .destructive) { alertAction in
            do {
                try Auth.auth().signOut()
                let vc = ViewController()
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: false, completion: nil)
            }catch {
                print("Error: ",error.localizedDescription)
            }
        }
        alert.addAction(signOutBtn)
        alert.addAction(UIAlertAction(title: "إلغاء", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
}

   

    
    

