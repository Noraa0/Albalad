//
//  LoginVC.swift
//  Albalad
//
//  Created by Nora on 02/06/1443 AH.
//

import UIKit
import Firebase
import FirebaseAuth


class LoginVC: UIViewController {

    let db = Firestore.firestore()
    var userId = Auth.auth().currentUser?.uid
    
 
    
    var appImage : UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "logoalbalad")
        return $0
    }(UIImageView())
    
    
    var subView : UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = #colorLiteral(red: 0.880281508, green: 0.8669131398, blue: 0.8231617808, alpha: 1)
        $0.layer.cornerRadius = 30
        return $0
    }(UIView())
    
    
    var cancelButton : UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("إلغاء", for: .normal)
        $0.setTitleColor(#colorLiteral(red: 0.2538028657, green: 0.2592750192, blue: 0.2415924966, alpha: 1) , for: .normal)
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector (cancel), for: .touchDown)
        return $0
    }(UIButton())
    
    
    let createLebel : UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "تسجيل الدخول"
        $0.textAlignment = .center
        $0.textColor = #colorLiteral(red: 0.2538028657, green: 0.2592750192, blue: 0.2415924966, alpha: 1)
        $0.font = UIFont(name: "GillSans-Italic", size: 25)
        return $0
    }(UILabel())
    
    let emailTextField : UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = #colorLiteral(red: 0.9417493416, green: 0.9417493416, blue: 0.9417493416, alpha: 1)
        $0.font = UIFont(name: "GillSans-Italic", size: 15)
        $0.placeholder = "البريد الإلكتروني"
        $0.layer.cornerRadius = 15
        $0.textAlignment = .right
        return $0
    }(UITextField())
    
    let passwordTextField : UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.placeholder = "كلمة المرور"
        $0.textAlignment = .right
        $0.isSecureTextEntry = true
        $0.backgroundColor = #colorLiteral(red: 0.9417493416, green: 0.9417493416, blue: 0.9417493416, alpha: 1)
        $0.font = UIFont(name: "GillSans-Italic", size: 15)
        $0.layer.cornerRadius = 15
        return $0
    }(UITextField())
    
    let forgetPassButton : UIButton = {
        $0.setTitle("نسيت كلمة المرور؟", for: .normal)
        $0.setTitleColor(.link , for: .normal)
        $0.layer.cornerRadius = 10
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector (forgetPassword), for: .touchDown)
        return $0
    }(UIButton())
    
    
    
    let logInButton : UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("تسجيل الدخول", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = #colorLiteral(red: 0.2538028657, green: 0.2592750192, blue: 0.2415924966, alpha: 1)
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector (loginBtnClicked), for: .touchDown)
        return $0
    }(UIButton())
    
    
    var loginLebel : UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "ليس لديك حساب؟"
        $0.textAlignment = .center
        $0.textColor = #colorLiteral(red: 0.2538028657, green: 0.2592750192, blue: 0.2415924966, alpha: 1)
        $0.font = UIFont(name: "GillSans-Italic", size: 20)
        return $0
    }(UILabel())
    
    let loginButton : UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("سجل الآن", for: .normal)
        $0.setTitleColor( #colorLiteral(red: 0.3786586225, green: 0.2085697949, blue: 0.1343922317, alpha: 1), for: .normal)
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector (signUp), for: .touchDown)
        return $0
    }(UIButton())

    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        
        view.backgroundColor = .white
  
        setUpUI()
        
    }
    
 
    
    
    
    private func setUpUI(){
        view.addSubview(appImage)
        view.addSubview(subView)
        view.addSubview(cancelButton)
        subView.addSubview(createLebel)
        subView.addSubview(emailTextField)
        subView.addSubview(passwordTextField)
        subView.addSubview(forgetPassButton)
        subView.addSubview(logInButton)
        subView.addSubview(loginLebel)
        subView.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            appImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            appImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            appImage.heightAnchor.constraint(equalToConstant: 100),
            appImage.widthAnchor.constraint(equalToConstant: 150),
            
            cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            cancelButton.leftAnchor.constraint(equalTo: view.leftAnchor),
            cancelButton.heightAnchor.constraint(equalToConstant: 50),
            cancelButton.widthAnchor.constraint(equalToConstant: 100),
            
            
            subView.topAnchor.constraint(equalTo: appImage.bottomAnchor, constant: 30),
            subView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            subView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            subView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            createLebel.topAnchor.constraint(equalTo: subView.topAnchor,constant: 20),
            createLebel.centerXAnchor.constraint(equalTo: subView.centerXAnchor),
            createLebel.widthAnchor.constraint(equalToConstant: 200),
            
            emailTextField.topAnchor.constraint(equalTo: createLebel.bottomAnchor,constant: 20),
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.widthAnchor.constraint(equalToConstant: 280),
            emailTextField.heightAnchor.constraint(equalToConstant: 30),
            
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor,constant: 20),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalToConstant: 280),
            passwordTextField.heightAnchor.constraint(equalToConstant: 30),
            
            forgetPassButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,constant: 20),
            forgetPassButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 5),
            forgetPassButton.widthAnchor.constraint(equalToConstant: 250),
            
            
            logInButton.topAnchor.constraint(equalTo: forgetPassButton.bottomAnchor,constant: 20),
            logInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logInButton.widthAnchor.constraint(equalToConstant: 150),
            logInButton.heightAnchor.constraint(equalToConstant: 35),
            
            loginLebel.topAnchor.constraint(equalTo: logInButton.bottomAnchor,constant: 80),
            loginLebel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            loginLebel.widthAnchor.constraint(equalToConstant: 150),
            loginLebel.heightAnchor.constraint(equalToConstant: 35),
            
            loginButton.topAnchor.constraint(equalTo: logInButton.bottomAnchor,constant: 80),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            loginButton.widthAnchor.constraint(equalToConstant: 150),
            loginButton.heightAnchor.constraint(equalToConstant: 35),
            
            
        ])
    }
    
    
    func logIn(email: String, password: String) {
        if emailTextField.text != "" && passwordTextField.text != "" {
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text! , completion: { user, error in
                
                if error == nil {
                    
                    let vc = ViewController()
                    self.present(vc, animated: true, completion: nil)


                }
                else{
                    let alert = UIAlertController(title: "تنبيه", message: error?.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "حسناً", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            })
        } else {
            let alert = UIAlertController(title: "بيانات ناقصة", message: "الرجاء التأكد من إدخال البريد الإلكتروني و كلمة المرور", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "حسناً", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
       
    
    @objc func loginBtnClicked(){
        logIn(email: emailTextField.text!,
              password: passwordTextField.text!)
    }
    
    
    
    @objc func signUp() {
        let vc = SignUpVC()
        present(vc, animated: true, completion: nil)
        
    }
    
    // to return a user into Main Page
    @objc func cancel() {
      dismiss(animated: true, completion: nil)
        
    }
    
    @objc func forgetPassword(){
        let forgetPassVC = ForgotPasswordVC()
        forgetPassVC.modalPresentationStyle = .fullScreen
        present(forgetPassVC, animated: true, completion: nil)
    }
    
}






