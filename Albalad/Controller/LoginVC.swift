//
//  LoginVC.swift
//  Albalad
//
//  Created by Nora on 28/05/1443 AH.
//

import UIKit
import Firebase

class LoginVC: UIViewController {

    
    // i did organized all views in Closures
    
    var appImage : UIImageView = {
        $0.image = UIImage(systemName: "heart")
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    
    
    let cancelButton : UIButton = {
        $0.setTitle("إلغاء", for: .normal)
        $0.setTitleColor(.link , for: .normal)
        $0.layer.cornerRadius = 10
        $0.translatesAutoresizingMaskIntoConstraints = false
//      cancelBtn.addTarget(self, action: #selector (cancel), for: .touchDown)
        return $0
    }(UIButton())
    
    let createLebel : UILabel = {
        $0.text = "تسجيل الدخول"
        $0.textColor = .white
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 20)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    let emailTextField : UITextField = {
        $0.placeholder = "البريد الإلكتروني"
        $0.textAlignment = .right
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITextField())
    
    let passwordTextField : UITextField = {
        $0.placeholder = "كلمة المرور"
        $0.textAlignment = .right
        $0.isSecureTextEntry = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITextField())
    
    let resetPassButton : UIButton = {
        $0.setTitle("نسيت كلمة المرور؟", for: .normal)
        $0.setTitleColor(.link , for: .normal)
        $0.layer.cornerRadius = 10
        $0.translatesAutoresizingMaskIntoConstraints = false
//      cancelBtn.addTarget(self, action: #selector (cancel), for: .touchDown)
        return $0
    }(UIButton())
    
    
    
    let logInButton : UIButton = {
        $0.setTitle("تسجيل الدخول", for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.6620503664, green: 0.728490293, blue: 0.6658555269, alpha: 1), for: .normal)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
//      logInBtn.addTarget(self, action: #selector (loginBtnClicked), for: .touchDown)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.7386419177, green: 0.6658993363, blue: 0.5561258197, alpha: 1)
        view.addSubview(appImage)
        view.addSubview(createLebel)
        view.addSubview(cancelButton)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(resetPassButton)
        view.addSubview(logInButton)
        
        
        setUpUI()
        
        
    }
    
    
    
    private func setUpUI(){
        [appImage,cancelButton,createLebel,emailTextField,passwordTextField,logInButton].forEach{view.addSubview($0)}

        NSLayoutConstraint.activate([
            appImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            appImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            appImage.heightAnchor.constraint(equalToConstant: 50),
            appImage.widthAnchor.constraint(equalToConstant: 50),
            
            cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            cancelButton.leftAnchor.constraint(equalTo: view.leftAnchor),
            cancelButton.heightAnchor.constraint(equalToConstant: 50),
            cancelButton.widthAnchor.constraint(equalToConstant: 100),

            createLebel.topAnchor.constraint(equalTo: appImage.bottomAnchor,constant: 20),
            createLebel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createLebel.widthAnchor.constraint(equalToConstant: 200),


            emailTextField.topAnchor.constraint(equalTo: createLebel.bottomAnchor,constant: 20),
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.widthAnchor.constraint(equalToConstant: 300),

            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor,constant: 20),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalToConstant: 300),
            
            resetPassButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,constant: 20),
            resetPassButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 5),
            resetPassButton.widthAnchor.constraint(equalToConstant: 250),

            logInButton.topAnchor.constraint(equalTo: resetPassButton.bottomAnchor,constant: 20),
            logInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logInButton.widthAnchor.constraint(equalToConstant: 300),
            logInButton.heightAnchor.constraint(equalToConstant: 50),


        ])
    }


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
//        
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
    


