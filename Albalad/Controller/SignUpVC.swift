//
//  SignUpVC.swift
//  Albalad
//
//  Created by Nora on 28/05/1443 AH.
//

import UIKit
import Firebase

class SignUpVC: UIViewController {
    
    
    // i did organized all views in Closures
    
    var appImage : UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        //        myImage.frame = CGRect(x: 170 , y: 50, width: 50, height: 50)
        $0.image = UIImage(systemName: "heart")
        return $0
    }(UIImageView())
    
    var cancelButton : UIButton = {
        //        cancelBtn.frame = CGRect(x: 30, y: 50, width: 60, height: 50)
        $0.setTitle("إلغاء", for: .normal)
        $0.setTitleColor(.link , for: .normal)
        $0.layer.cornerRadius = 10
        $0.translatesAutoresizingMaskIntoConstraints = false
        //        cancelBtn.addTarget(self, action: #selector (cancel), for: .touchDown)
        
        return $0
    }(UIButton())
    
    
    var createLebel : UILabel = {
        //        create.frame = CGRect(x: 100 , y: 120, width: 200, height: 30)
        $0.text = "إنشاء حساب"
        $0.textAlignment = .center
        $0.textColor = .white
        $0.font = .boldSystemFont(ofSize: 20)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    
    let nameTextField : UITextField = {
        //        nameTF.frame = CGRect(x: 60, y: 180, width: 220, height: 30)
        $0.placeholder = "الإسم"
        $0.textAlignment = .right
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITextField())
    
    let emailTextField : UITextField = {
        //        emailTF.frame = CGRect(x: 60, y: 230, width: 220, height: 30)
        $0.placeholder = "البريد الإلكتروني"
        $0.textAlignment = .right
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITextField())
    
    let passwordTextField : UITextField = {
        //        passwordTF.frame = CGRect(x: 60, y: 280, width: 220, height: 30)
        $0.placeholder = "كلمة المرور"
        $0.textAlignment = .right
        $0.isSecureTextEntry = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITextField())
    
    
    let SignUpButton : UIButton = {
        //        signUpBtn.frame = CGRect(x: 150, y: 350, width: 100, height: 30)
        $0.setTitle("تسجيل", for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.6620503664, green: 0.728490293, blue: 0.6658555269, alpha: 1), for: .normal)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        //        signUpBtn.addTarget(self, action: #selector (createUser), for: .touchDown)
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UIButton())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.7386419177, green: 0.6658993363, blue: 0.5561258197, alpha: 1)
        view.addSubview(appImage)
        view.addSubview(cancelButton)
        view.addSubview(createLebel)
        view.addSubview(nameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(SignUpButton)
        
        setUpUI()
    }
    
    
    private func setUpUI(){
        [appImage,cancelButton,createLebel,nameTextField,emailTextField,passwordTextField,SignUpButton].forEach{view.addSubview($0)}
        
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
            
            nameTextField.topAnchor.constraint(equalTo: createLebel.bottomAnchor,constant: 20),
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextField.widthAnchor.constraint(equalToConstant: 300),
            
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor,constant: 20),
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.widthAnchor.constraint(equalToConstant: 300),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor,constant: 20),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalToConstant: 300),
            
            SignUpButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,constant: 20),
            SignUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            SignUpButton.widthAnchor.constraint(equalToConstant: 300),
            SignUpButton.heightAnchor.constraint(equalToConstant: 50),
            
            
        ])
    }
    
    
    
//        function that allow the user to create an account
    
//        func creatNewUser(name:String, email: String, password: String) {
//            nameTextField.text = name
//            emailTextField.text = email
//            passwordTextField.text = password
//            let homeVC = HomePageVC()
//            Auth.auth().createUser(withEmail: email, password: password){
//                authResult , error in
//
//                if error == nil {
//                    homeVC.modalPresentationStyle = .fullScreen
//                    self.present(homeVC, animated: true, completion: nil)
//                }else {
//                    print(error?.localizedDescription)
//                }
//            }//end of creating new user
//        }//end of creatNewUser
    
//        @objc func createUser() {
//        creatNewUser(name: nameTextField.text!,
//        email: emailTextField.text!,
//        password: passwordTextField.text!
//        )
//        add()
//        }
//
//
//        func add(){
//            self.db.collection("Users")
//              .addDocument(data: [
//                "name" : nameTextField.text! ,
//                "email" : emailTextField.text!,
//                "ID" : user?.uid
//              ])
//          }
    
//         to return a user into Main Page
        @objc func cancel() {
            let mainPage = MainPageVC()
            mainPage.modalPresentationStyle = .fullScreen
            present(mainPage, animated: true, completion: nil)
    
        }
}
