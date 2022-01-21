//
//  LandmarkAlbaladVC.swift
//  Albalad
//
//  Created by Nora on 13/06/1443 AH.
//

import UIKit

class LandmarkAlbaladVC: UIViewController{
    

    var landmarksArray = [Landmark(name: "بيت الهزازي", description: "يمتلكه آل الهزازي الأسرة العريقة والتي منهم محمد الهزازي من أوائل رؤساء بلدية جدة في العهد السعودي",
                                   landmarkImg: UIImage(named: "بيت الهزازي معالم")!),
                          Landmark(name: "بيت سلوم", description: "بيت سلوم الذي تحول إلى متحف مؤخرا يروي عن العمدة، الذي ينهي مشكلات الحي، وعن تلك الجدة ذات الجود والكرم ومجلسها الطيب", landmarkImg: UIImage(named: "سلوم معالم")!),
                          Landmark(name: "بيت نور ولي", description: "بيت نور ولي يقع في نطاق حارة اليمن ويطل على الشارع الفاصل بين حارة اليمن والمظلوم وهو من الابنية التاريخية الرائعة", landmarkImg: UIImage(named: "بيت نور ولي")!),
                          Landmark(name: "بيت باجنيد", description: "بيت باجنيد أحد اشهر واعرق بيوت منطقة جدة التاريخية والذي يتميز بالفن المعماري الجميل", landmarkImg: UIImage(named: "بيت باجنيد")!),
                          Landmark(name: "بيت الجمجوم", description: "بيت الجمجوم أحد بيوت جدة التاريخيّة، ويبلغ عمره نحو 200 سنة"
                                   , landmarkImg: UIImage(named: "بيت الجمجوم")!)
    ]
    
    
    
    var landmarkLable: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "معالم المنطقة"
        $0.font = UIFont(name: "GillSans-Italic", size: 25)
        $0.textColor = .black
        return $0
    }(UILabel())
    
    lazy var tableView : UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(LandmarkAlbaladCell.self, forCellReuseIdentifier: LandmarkAlbaladCell.id)
        $0.delegate = self
        $0.dataSource = self
      
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
        
        view.addSubview(landmarkLable)
        view.addSubview(tableView)
        view.addSubview(backButton)
        
        
        
        NSLayoutConstraint.activate([
            
            landmarkLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            landmarkLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            tableView.topAnchor.constraint(equalTo: landmarkLable.bottomAnchor, constant: 30),
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
extension LandmarkAlbaladVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarksArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LandmarkAlbaladCell.id, for: indexPath) as! LandmarkAlbaladCell
        cell.landmarkName.text = landmarksArray[indexPath.row].name
        cell.landmarkDes.text = landmarksArray[indexPath.row].description
        cell.landmarkImg.image = landmarksArray[indexPath.row].landmarkImg
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    
}



    



