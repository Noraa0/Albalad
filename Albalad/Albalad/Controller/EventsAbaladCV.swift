//
//  EventsCV.swift
//  Albalad
//
//  Created by Nora on 16/06/1443 AH.
//

import UIKit

class EventsAbaladCV: UIViewController {

  
    var eventsArray = [
        Event(name: "مهرجان البحر الأحمر", description: "", price: "١٠٠ريال", eventImg:  UIImage(named: "مهرجان")!),
        Event(name: "إقامة فنية", description: "", price: "١٢٠ريال", eventImg: UIImage(named: "فعالية")!),
        Event(name: "جولة في البلد", description: "", price: "١٥٠ريال", eventImg: UIImage(named: "فعالية-1")!),
        Event(name: "متحف الضيافة", description: "", price: "١٠ريال", eventImg: UIImage(named: "فعالية-٣")!)]
    
    
    
    var eventLable: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "الفعاليات"
        $0.font = UIFont(name: "GillSans-Italic", size: 25)
        $0.textColor = .black
        return $0
    }(UILabel())
    
    lazy var tableView : UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(EventsAlbaladCell.self, forCellReuseIdentifier: EventsAlbaladCell.id)
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
        
        view.addSubview(eventLable)
        view.addSubview(tableView)
        view.addSubview(backButton)
        
        
        
        NSLayoutConstraint.activate([
            
            eventLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            eventLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            tableView.topAnchor.constraint(equalTo: eventLable.bottomAnchor, constant: 30),
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
extension EventsAbaladCV: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EventsAlbaladCell.id, for: indexPath) as! EventsAlbaladCell
        
        cell.eventName.text = eventsArray[indexPath.row].name
        cell.eventDes.text = eventsArray[indexPath.row].description
        cell.eventImg.image = eventsArray[indexPath.row].eventImg
        cell.eventPrice.text = eventsArray[indexPath.row].price
   
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = EventReservationVC()
        vc.eventNameSelected = indexPath.row
        present(vc, animated: true, completion: nil)
    }
    
    
}



    



