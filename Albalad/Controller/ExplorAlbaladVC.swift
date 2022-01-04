//
//  ExplorAlbaladVC.swift
//  Albalad
//
//  Created by Nora on 30/05/1443 AH.
//

import UIKit

class ExplorAlbaladVC: UIViewController {
    
    
    var explorBLable: UILabel = {
        $0.text = "اكتشف البلد"
        $0.textColor = .red
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    
    let explorCollectionView: UICollectionView = {
        // init the layout
        let layout = UICollectionViewFlowLayout()
        // set the direction to be horizontal
        layout.scrollDirection = .vertical
        // the instance of collectionView
        let explorCv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        // Activate constaints
        explorCv.translatesAutoresizingMaskIntoConstraints = false
        return explorCv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(explorBLable)
        view.addSubview(explorCollectionView)
        
        explorCollectionView.register(ExplorAlbaladCell.self, forCellWithReuseIdentifier: ExplorAlbaladCell.identifier)
        
        explorCollectionView.dataSource = self
        explorCollectionView.delegate = self
        
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
        [explorBLable,explorCollectionView].forEach{view.addSubview($0)}
        
        NSLayoutConstraint.activate([
            explorBLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            explorBLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            explorBLable.heightAnchor.constraint(equalToConstant: 50),
            explorBLable.widthAnchor.constraint(equalToConstant: 100),
            
            explorCollectionView.topAnchor.constraint(equalTo: explorBLable.bottomAnchor,constant: 20),
            explorCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            explorCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            explorCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
        
    }
}

extension ExplorAlbaladVC :  UICollectionViewDelegate , UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =   explorCollectionView.dequeueReusableCell(withReuseIdentifier: ExplorAlbaladCell.identifier, for: indexPath) as! ExplorAlbaladCell
        
        cell.explorImg.image = UIImage(systemName: "star")
        return cell
    }
}

extension ExplorAlbaladVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width/2.5, height: collectionView.frame.size.height/4)
        
    }

}
