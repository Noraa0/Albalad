//
//  InvestmentsAlbaladVC.swift
//  Albalad
//
//  Created by Nora on 02/06/1443 AH.
//

import UIKit

class InvestmentsAlbaladVC: UIViewController {

    
    var investments : [Invest] =
    [Invest(investName: "المتاحف", investImg: UIImage(named: "معلم")!),
     Invest(investName: "الفنادق", investImg: UIImage(named: "معلم")!),
     Invest(investName: "المعارض", investImg: UIImage(named: "معلم")!)
    ]
    
    
    
    var investBLable: UILabel = {
        $0.text = "الاستثمارات"
        $0.textColor = .red
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    
    let investCollectionView: UICollectionView = {
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
        
        view.addSubview(investBLable)
        view.addSubview(investCollectionView)
        
        investCollectionView.register(InvestAlbaladCell.self, forCellWithReuseIdentifier: InvestAlbaladCell.identifier)
        
        investCollectionView.dataSource = self
        investCollectionView.delegate = self
        
        setUpUI()
        
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
        [investBLable,investCollectionView].forEach{view.addSubview($0)}
        
        NSLayoutConstraint.activate([
            investBLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            investBLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            investBLable.heightAnchor.constraint(equalToConstant: 50),
            investBLable.widthAnchor.constraint(equalToConstant: 100),
            
            investCollectionView.topAnchor.constraint(equalTo: investBLable.bottomAnchor,constant: 20),
            investCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            investCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            investCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
        
    }
}

extension InvestmentsAlbaladVC : UICollectionViewDelegate , UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return investments.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = investCollectionView.dequeueReusableCell(withReuseIdentifier: InvestAlbaladCell.identifier, for: indexPath) as! InvestAlbaladCell
        
        cell.explorImg.image = investments[indexPath.item].investImg
        cell.explorLable.text = investments[indexPath.item].investName
        return cell
    }
}

extension InvestmentsAlbaladVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width/3.5, height: collectionView.frame.size.height/4)
        
    }
    
    
}
