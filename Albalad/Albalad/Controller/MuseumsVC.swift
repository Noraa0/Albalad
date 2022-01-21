//
//  MuseumsVC.swift
//  Albalad
//
//  Created by Nora on 02/06/1443 AH.
//

import UIKit
import Firebase

class MuseumsVC: UIViewController {
    
    let user = Auth.auth().currentUser

    
    var museumArray = [Museum(name: "بيت البلد", museumImg: UIImage(named: "بيت البلد")!, price: "٣٠٠ريال", description: "هو بيت لعائلة آل باجنيد وقد سكنته السفارة البريطانية كما سكنته مديرية الشرطة إبان مديرها عبدالمجيد شبكشي"),
                       Museum(name: "بيت نصيف", museumImg: UIImage(named: "بيت نصيف")!, price: "٣٥٠ريال", description: "بيت الأفندي محمد حسين نصيف وأولاده التاريخي بني عام 1281هـ وهو يقع في حارة اليمن بناه الجد الأكبر عمر نصيف وقد صممه مهندس يدعى سرسار واستمر العمل به سبع سنوات وأقام فيه الملك عبدالعزيز واتخذه سكنًا مؤقتًا له عند دخوله جدة"),
                       
                       Museum(name: "بيت باعشن", museumImg: UIImage(named: "بيت باعشن")!, price: "٤٠٠ريال", description: ""),
                       
                       Museum(name: "بيت سليمان قابل", museumImg: UIImage(named: "بيت سليمان قابل")!, price: "٢٠٠ريال", description: ""),
    ]
    var museumS : Int?
    
    
    var museumLable: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "المتاحف"
        $0.font = UIFont(name: "GillSans-Italic", size: 25)
        $0.textColor = .black
        return $0
    }(UILabel())
    
    
    lazy var tableView : UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(MuseumAlbaladCell.self, forCellReuseIdentifier: MuseumAlbaladCell.id)
        $0.estimatedRowHeight = 200
        $0.translatesAutoresizingMaskIntoConstraints = false
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
        
        view.addSubview(museumLable)
        view.addSubview(tableView)
        view.addSubview(backButton)
        
        NSLayoutConstraint.activate([
            
            museumLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            museumLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: museumLable.bottomAnchor, constant: 30),
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

extension MuseumsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return museumArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MuseumAlbaladCell.id, for: indexPath) as! MuseumAlbaladCell
        cell.museumName.text = museumArray[indexPath.row].name
        cell.museumImg.image = museumArray[indexPath.row].museumImg
        cell.museumDes.text = museumArray[indexPath.row].description
        cell.museumPrice.text = museumArray[indexPath.row].price
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            let vc = MuseumReservationVC()
            vc.museumNameSelected = indexPath.row
            present(vc, animated: true, completion: nil)
        }
        
}


