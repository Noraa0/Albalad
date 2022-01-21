//
//  MainPageVC.swift
//  Albalad
//
//  Created by Nora on 02/06/1443 AH.
//

import UIKit
import Firebase


class MainPageVC: UIViewController{
    
    
    var explorArray = [Invest(investName: "عن البلد", investImg: UIImage(named: "1500x500")!),
                       Invest(investName: "معالم المنطقة",investImg: UIImage(named: "باجنيد")!),
                       Invest(investName: "معرض الصور",investImg: UIImage(named: "معلم")!),
                       Invest(investName: "متاحف",investImg: UIImage(named: "متحف")!),
                       Invest(investName: "فنادق",investImg: UIImage(named: "بيت")!),
                       Invest(investName: "فعاليات",investImg: UIImage(named: "فعالية")!),
                       Invest(investName: "جولات سياحية",investImg: UIImage(named: "سياحة")!)
    ]
    
    
    
    var mainView : UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOffset = CGSize(width: 5, height: 5)
        $0.layer.shadowOpacity = 0.7
        $0.layer.shadowRadius = 10.0
        return $0
    }(UIView())
    
    var mainImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "main")
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        return $0
    }(UIImageView())
    
    
    var explorBLable: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "اكتشف البلد"
        $0.backgroundColor = #colorLiteral(red: 0.2183634341, green: 0.4241205454, blue: 0.4433012903, alpha: 0.5)
        $0.font = UIFont.systemFont(ofSize: 20)
        $0.textColor = .white
        return $0
    }(UILabel())
    
    
    
    var explorCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let explorCv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        explorCv.translatesAutoresizingMaskIntoConstraints = false
        explorCv.semanticContentAttribute = .forceRightToLeft
        return explorCv
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setupSubCells()
    }
    
    
    
    private func setUpUI() {
        
        view.backgroundColor = .white
        view.addSubview(mainView)
        mainView.addSubview(mainImage)
        view.addSubview(explorBLable)
        
        NSLayoutConstraint.activate([
            
            
            mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            mainImage.topAnchor.constraint(equalTo: mainView.topAnchor,constant: 20),
            mainImage.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: 10),
            mainImage.heightAnchor.constraint(equalToConstant: 180),
            mainImage.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: -10),
            
            explorBLable.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 20),
            explorBLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 5),
            explorBLable.heightAnchor.constraint(equalToConstant: 30),
            explorBLable.widthAnchor.constraint(equalToConstant: 120),
            
            
            
            
        ])
    }
    
    fileprivate func setupSubCells(){
        
        view.addSubview(explorCollectionView)
        
        
        explorCollectionView.register(ExplorCVCell.self, forCellWithReuseIdentifier: ExplorCVCell.identifier)
        
        
        explorCollectionView.dataSource = self
        explorCollectionView.delegate = self
        
        
        NSLayoutConstraint.activate([
            explorCollectionView.topAnchor.constraint(equalTo: explorBLable.bottomAnchor),
            explorCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            explorCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            explorCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            
        ])
    }
    
    
}


extension MainPageVC :  UICollectionViewDelegate , UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return explorArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = explorCollectionView.dequeueReusableCell(withReuseIdentifier: ExplorCVCell.identifier, for: indexPath) as! ExplorCVCell
        
        cell.explorImg.image = explorArray[indexPath.item].investImg
        cell.explorLable.text = explorArray[indexPath.item].investName
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.item == 0 {
            let vc = AboutAlbaladVC()
            present(vc, animated: true, completion: nil)
            
        }else if indexPath.item == 1 {
            let vc = LandmarkAlbaladVC()
            present(vc, animated: true, completion: nil)
            
        }else if indexPath.item == 2 {
            let vc = PhotoGalleryVC()
            present(vc, animated: true, completion: nil)
            
        }else if indexPath.item == 3 {
            let vc = MuseumsVC()
            present(vc, animated: true, completion: nil)
            
        }else if indexPath.item == 4 {
            let vc = HotelsVC()
            present(vc, animated: true, completion: nil)
            
        }else if indexPath.item == 5 {
            let vc = EventsAbaladCV()
            present(vc, animated: true, completion: nil)
            
        }else if indexPath.item == 6 {
            let vc = ToursVC()
            present(vc, animated: true, completion: nil)
        }
 
    }
    
}


extension MainPageVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item == 0 {
           return CGSize(width: 350, height: 130)
        }
        else{
           return CGSize(width: 180, height: 100)
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 40
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 15, left: 10, bottom: 30, right: 10)
    }
    
    
    
    
}



        



        
        

        

    


 
