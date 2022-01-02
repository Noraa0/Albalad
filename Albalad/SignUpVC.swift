//
//  SignUpVC.swift
//  Albalad
//
//  Created by Nora on 28/05/1443 AH.
//

import UIKit
import Firebase

class SignUpVC: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.6620503664, green: 0.728490293, blue: 0.6658555269, alpha: 1)
        view.addSubview(appImage)
        view.addSubview(cancelButton)
        view.addSubview(createLebel)
        view.addSubview(nameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(SignUpButton)

    }
    
    
    
    // i did organized all views in Closures
    
    let appImage : UIImageView = {
        let myImage = UIImageView()
        myImage.frame = CGRect(x: 170 , y: 50, width: 50, height: 50)
        myImage.image = UIImage(named: "Twitter")
        return myImage
    }()
    
    let cancelButton : UIButton = {
        let cancelBtn = UIButton()
        cancelBtn.frame = CGRect(x: 30, y: 50, width: 60, height: 50)
        cancelBtn.setTitle("cencel", for: .normal)
        cancelBtn.setTitleColor(.link , for: .normal)
        cancelBtn.layer.cornerRadius = 10
//        cancelBtn.addTarget(self, action: #selector (cancel), for: .touchDown)
        
        return cancelBtn
    }()
    
    
    let createLebel : UILabel = {
        let create = UILabel()
        create.frame = CGRect(x: 100 , y: 120, width: 200, height: 30)
        create.text = "Create your account"
        create.textColor = .white
        create.font = .boldSystemFont(ofSize: 20)
        return create
    }()
    
    
    let nameTextField : UITextField = {
        let nameTF = UITextField()
        nameTF.frame = CGRect(x: 60, y: 180, width: 220, height: 30)
        nameTF.placeholder = "Name"
        return nameTF
    }()
    
    let emailTextField : UITextField = {
        let emailTF = UITextField()
        emailTF.frame = CGRect(x: 60, y: 230, width: 220, height: 30)
        emailTF.placeholder = "email address"
        return emailTF
    }()
    
    let passwordTextField : UITextField = {
        let passwordTF = UITextField()
        passwordTF.frame = CGRect(x: 60, y: 280, width: 220, height: 30)
        passwordTF.placeholder = "password"
        passwordTF.isSecureTextEntry = true
        return passwordTF
    }()
    
    
    let SignUpButton : UIButton = {
        let signUpBtn = UIButton()
        signUpBtn.frame = CGRect(x: 150, y: 350, width: 100, height: 30)
        signUpBtn.setTitle("Sign Up", for: .normal)
        signUpBtn.setTitleColor(#colorLiteral(red: 0.6620503664, green: 0.728490293, blue: 0.6658555269, alpha: 1), for: .normal)
        signUpBtn.backgroundColor = .white
        signUpBtn.layer.cornerRadius = 10
//        signUpBtn.addTarget(self, action: #selector (createUser), for: .touchDown)
        
        return signUpBtn
    }()

    
    
    //function that allow the user to create an account
    
//    func creatNewUser(name:String, email: String, password: String) {
//        nameTextField.text = name
//        emailTextField.text = email
//        passwordTextField.text = password
//        let homeVC = HomePageVC()
//        Auth.auth().createUser(withEmail: email, password: password){
//            authResult , error in
//
//            if error == nil {
//                homeVC.modalPresentationStyle = .fullScreen
//                self.present(homeVC, animated: true, completion: nil)
//            }else {
//                print(error?.localizedDescription)
//            }
//        }//end of creating new user
//    }//end of creatNewUser

//    @objc func createUser() {
//    creatNewUser(name: nameTextField.text!,
//    email: emailTextField.text!,
//    password: passwordTextField.text!
//    )
//    add()
//    }
    
    
//    func add(){
//        self.db.collection("Users")
//          .addDocument(data: [
//            "name" : nameTextField.text! ,
//            "email" : emailTextField.text!,
//            "ID" : user?.uid
//          ])
//      }
    
    // to return a user into Main Page
//    @objc func cancel() {
//        let mainPage = MainPageVC()
//        mainPage.modalPresentationStyle = .fullScreen
//        present(mainPage, animated: true, completion: nil)
//
//    }
}
