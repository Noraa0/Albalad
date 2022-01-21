//
//  AboutAlbaladVC.swift
//  Albalad
//
//  Created by Nora on 13/06/1443 AH.
//

import UIKit

class AboutAlbaladVC: UIViewController {
    

    
    var albaladImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "logo1")
        return $0
    }(UIImageView())
    
    var albaladView : UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    

    
    var albaladText: UITextView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .white
        $0.text = "ضمن قائمة اليونسكو لمواقع التراث العالمي(البلد)، هكذا يسميها أهلها. بوابة الحرمين الشريفين، تعرفها من بيوتها المبنية بالحجر (المنقبي) والمزينة بالـرواشين، ومطاعمها التي تقدم أشهى المأكولات. بينما تخطو أولى خطواتك من باب مكة إلى بيت نصيف ومسجد المعمار، ستمرّ من سوق العلوي، الذي لونته التوابل والأقمشة بألوف الألوان، لتكون شاهدًا على التاريخ الحي لأكثر من ٦٠٠ مبنىً تراثياً و٣٠ مسجداً و٥ أسواق تاريخية، وتستمع إلى قصص آسرة عن أسطورة حضرية اسمها (البلد)، ترويها جدرانها وأزقتها العتيقة قبل سكانها."
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        $0.backgroundColor = .clear
        $0.layer.cornerRadius = 10
        $0.isEditable = false
        return $0
    }(UITextView())
    
    var albaladLable: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "اكتشف البلد"
        $0.textColor = .black
        return $0
    }(UILabel())
    
    var backButton : UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(systemName: "chevron.forward.square.fill"), for: .normal)
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector (backBtn), for: .touchDown)
        return $0
    }(UIButton())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
    }
    
    
    func setUp() {
        

        view.backgroundColor = #colorLiteral(red: 0.609339416, green: 0.7086400986, blue: 0.7201904655, alpha: 1)
        view.addSubview(albaladView)
        albaladView.addSubview(albaladImage)
        albaladView.addSubview(albaladText)
        albaladView.addSubview(backButton)
        
        
        
        NSLayoutConstraint.activate([
            
            albaladView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            albaladView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            albaladView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            albaladView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            albaladImage.topAnchor.constraint(equalTo: albaladView.topAnchor,constant: 20),
            albaladImage.leadingAnchor.constraint(equalTo: albaladView.leadingAnchor,constant: 50),
            albaladImage.heightAnchor.constraint(equalToConstant: 150),
            albaladImage.widthAnchor.constraint(equalToConstant: 100),
            albaladImage.trailingAnchor.constraint(equalTo: albaladView.trailingAnchor,constant: -50),
            

            
            albaladText.topAnchor.constraint(equalTo: albaladImage.bottomAnchor,constant: 30),
            albaladText.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            albaladText.heightAnchor.constraint(equalToConstant: 450),
            albaladText.widthAnchor.constraint(equalToConstant: 200),
            albaladText.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30),
            
            backButton.topAnchor.constraint(equalTo: albaladView.topAnchor,constant: 20),
            backButton.trailingAnchor.constraint(equalTo: albaladView.trailingAnchor,constant: -15),
   
            
            
            
        ])
    }
    
    
    @objc func backBtn() {
        dismiss(animated: true)
    }
}
