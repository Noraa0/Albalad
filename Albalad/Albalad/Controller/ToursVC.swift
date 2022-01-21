//
//  ToursVC.swift
//  Albalad
//
//  Created by Nora on 14/06/1443 AH.
//

import UIKit

class ToursVC: UIViewController {

    
    var toursArray = [Tours(name: "عبير أبوسليمان", description: "أول سعودية تحصل على رخصة مرشد سياحي\n\n تتحدث (3) لغات :\nالعربية | English | French \n                                                                                    معلومات الاتصال : \n Abir_la_geniale@yahoo.com , +966503362262",
                      tourImg: UIImage(named: "عبير")!),
                      Tours(name: "سمير قمصاني", description: "من أوائل المرشدين السياحيين في المملكة العربية السعودية، مؤسس ورئيس جمعية المرشدين السياحيين السعودية \n                                                                                                   يتحدث (2) لغات:  \n Arabic | English  \n\n معلومات الاتصال: \n No.1tourguideksa@gmail.com,+966502757823",
                                        tourImg: UIImage(named: "سمير")!),
                      Tours(name: "بندر الحربي", description: "مرشد سياحي معتمد منذ عام ٢٠٠٥ ، وعضو الجمعية السعودية للإرشاد السياحي \n\n يتحدث (1) لغات: \n العربية \n\n معلومات الإتصال: \n b0505308610@gmail.com ، +966505308610",
                                        tourImg: UIImage(named: "بندر")!),
                      Tours(name: "سامي خيري", description: "سامي مرشد سياحي وطني شديد الشغف بالثقافة والتراث، كما أنه مدرب دولي معتمد من الاتحاد العالمي لجمعيات المرشدين السياحيين \n \n يتحدث (2) لغات: \n Arabic | English \n \n معلومات الاتصال: \n skhiary@hotmail.com ، +966553892077",
                                        tourImg: UIImage(named: "سامي")!)


    ]
    
    
    var toursLable: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "المرشدين السياحيين"
        $0.font = UIFont(name: "GillSans-Italic", size: 25)
        $0.textColor = .black
        return $0
    }(UILabel())
    
    lazy var tableView : UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(ToursCell.self, forCellReuseIdentifier: ToursCell.id)
        $0.delegate = self
        $0.dataSource = self
        $0.rowHeight = UITableView.automaticDimension
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
    
    
    func setUp() {
        
        view.addSubview(toursLable)
        view.addSubview(tableView)
        view.addSubview(backButton)

        NSLayoutConstraint.activate([
        
        toursLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
        
        toursLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        tableView.topAnchor.constraint(equalTo: toursLable.bottomAnchor, constant: 30),
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

extension ToursVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toursArray.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ToursCell.id, for: indexPath) as! ToursCell
        
        cell.tourImg.image = toursArray[indexPath.row].tourImg
        cell.tourName.text = toursArray[indexPath.row].name
        cell.tourDes.text = toursArray[indexPath.row].description
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
}


