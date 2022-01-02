//
//  LoginVC.swift
//  Albalad
//
//  Created by Nora on 28/05/1443 AH.
//

import UIKit
import Firebase

class LoginVC: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.6620503664, green: 0.728490293, blue: 0.6658555269, alpha: 1)
        view.addSubview(appImage)
        view.addSubview(createLebel)
        view.addSubview(cancelButton)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(logInButton)
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
        create.frame = CGRect(x: 110 , y: 150, width: 200, height: 30)
        create.text = "Hello My Friend!♡"
        create.textColor = .white
        create.font = .boldSystemFont(ofSize: 20)
        return create
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
    
    
    
    let logInButton : UIButton = {
        let logInBtn = UIButton()
        logInBtn.frame = CGRect(x: 150, y: 350, width: 100, height: 30)
        logInBtn.setTitle("Log in", for: .normal)
        logInBtn.setTitleColor(#colorLiteral(red: 0.6620503664, green: 0.728490293, blue: 0.6658555269, alpha: 1), for: .normal)
        logInBtn.backgroundColor = .white
        logInBtn.layer.cornerRadius = 10
//      logInBtn.addTarget(self, action: #selector (loginBtnClicked), for: .touchDown)
        return logInBtn
    }()

//
//    func logIn(email: String, password: String) {
//
//            emailTextField.text = email
//            passwordTextField.text = password
//            let homeVC = HomePageVC()
//            Auth.auth().signIn(withEmail: email, password: password){ authResult, error in
//                if error == nil{
//                    homeVC.modalPresentationStyle = .fullScreen
//                self.present(homeVC, animated: true, completion: nil)
//                }else{
//                    print(error?.localizedDescription)
//                }
//            }
//
//        }
        
//        @objc func loginBtnClicked(){
//            logIn(email: emailTextField.text!,
//            password: passwordTextField.text!)
//        }
    
    // to return a user into Main Page
//    @objc func cancel() {
//        let mainPage = MainPageVC()
//        mainPage.modalPresentationStyle = .fullScreen
//        present(mainPage, animated: true, completion: nil)
//
//    }

}


  
//      func uiSettings(){
//          [appName,logo,email,password,signIn,signUpLabel,signUp].forEach{view.addSubview($0)}
//          NSLayoutConstraint.activate([
//          appName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 150),
//          appName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//
//          logo.topAnchor.constraint(equalTo: appName.bottomAnchor,constant: 20),
//          logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//          logo.heightAnchor.constraint(equalToConstant: 230),
//          logo.widthAnchor.constraint(equalToConstant: 200),
//
//          email.topAnchor.constraint(equalTo: logo.bottomAnchor,constant: 40),
//          email.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//          email.widthAnchor.constraint(equalToConstant: 300),
//
//          password.topAnchor.constraint(equalTo: email.bottomAnchor,constant: 20),
//          password.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//          password.widthAnchor.constraint(equalToConstant: 300),
//
//          signIn.topAnchor.constraint(equalTo: password.bottomAnchor,constant: 20),
//          signIn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//          signIn.heightAnchor.constraint(equalToConstant: 50),
//          signIn.widthAnchor.constraint(equalToConstant: 300),
//
//          signUpLabel.topAnchor.constraint(equalTo: signIn.bottomAnchor,constant: 20),
//          signUpLabel.leadingAnchor.constraint(equalTo: signIn.leadingAnchor,constant: 40),
//
//          signUp.firstBaselineAnchor.constraint(equalTo: signUpLabel.firstBaselineAnchor),
//          signUp.leadingAnchor.constraint(equalTo: signUpLabel.trailingAnchor,constant: 10)
//
//          ])
//      }
    


