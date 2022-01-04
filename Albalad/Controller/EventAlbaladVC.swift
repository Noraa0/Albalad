//
//  EventAlbaladVC.swift
//  Albalad
//
//  Created by Nora on 30/05/1443 AH.
//

import UIKit

class EventAlbaladVC: UIViewController {
    
    var eventsBLable: UILabel = {
        $0.text = "الفعاليات"
        $0.textAlignment = .center
        $0.textColor = .red
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    
    let eventsCollectionView: UICollectionView = {
        // init the layout
        let layout = UICollectionViewFlowLayout()
        // set the direction to be horizontal
        layout.scrollDirection = .vertical
        // the instance of collectionView
        let investCv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        // Activate constaints
        investCv.translatesAutoresizingMaskIntoConstraints = false
        return investCv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(eventsBLable)
        view.addSubview(eventsCollectionView)
        
        eventsCollectionView.register(EventAlbaladCell.self, forCellWithReuseIdentifier: EventAlbaladCell.identifier)
        
        eventsCollectionView.dataSource = self
        eventsCollectionView.delegate = self
        
        setUpUI()
        
        // setup constrainst
        // make it fit all the space of the CustomCell
        //        explorCollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        //        explorCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        //        explorCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        //        explorCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    
    //    fileprivate func setupSubCells(){
    //        // add collectionView to the view
    //        view.addSubview(explorCollectionView)
    //
    //        explorCollectionView.register(ExplorCVCell.self, forCellWithReuseIdentifier: ExplorCVCell.identifier)
    //
    //        explorCollectionView.dataSource = self
    //        explorCollectionView.delegate = self
    //        // setup constrainst
    //        // make it fit all the space of the CustomCell
    //        explorCollectionView.topAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    //        explorCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    //        explorCollectionView.bottomAnchor.constraint(equalTo: view.topAnchor).isActive = true
    //        explorCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    //
    //}
    //
    
    private func setUpUI(){
        [eventsBLable,eventsCollectionView].forEach{view.addSubview($0)}
        
        NSLayoutConstraint.activate([
            eventsBLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            eventsBLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            eventsBLable.heightAnchor.constraint(equalToConstant: 50),
            eventsBLable.widthAnchor.constraint(equalToConstant: 100),
            
            eventsCollectionView.topAnchor.constraint(equalTo: eventsBLable.bottomAnchor,constant: 20),
            eventsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            eventsCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            eventsCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
        
    }
}

extension EventAlbaladVC :  UICollectionViewDelegate , UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =   eventsCollectionView.dequeueReusableCell(withReuseIdentifier: EventAlbaladCell.identifier, for: indexPath) as! EventAlbaladCell
        
        cell.eventImg.image = UIImage(systemName: "star")
        return cell
    }
}


extension EventAlbaladVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width/2.5, height: collectionView.frame.size.height/4)
        
    }
    
}




 

