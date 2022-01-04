//
//  MainPageVC.swift
//  Albalad
//
//  Created by Nora on 29/05/1443 AH.
//

import UIKit

    
class MainPageVC: UIViewController{

    
     var mainImage: UIImageView = {
        $0.image = UIImage(named: "البلد")
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    
    var explorBLable: UILabel = {
        $0.text = "اكتشف البلد"
        $0.textColor = .red
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    var allButton : UIButton = {
        //      cancelBtn.frame = CGRect(x: 30, y: 50, width: 60, height: 50)
        $0.setTitle("الكل", for: .normal)
        $0.setTitleColor(.link , for: .normal)
        $0.layer.cornerRadius = 10
        $0.tag = 1
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector (clickedBtn), for: .touchDown)
        return $0
    }(UIButton())
    
    
     var explorCollectionView : UICollectionView = {
           // init the layout
           let layout = UICollectionViewFlowLayout()
           // set the direction to be horizontal
           layout.scrollDirection = .horizontal
           // the instance of collectionView
           let explorCv = UICollectionView(frame: .zero, collectionViewLayout: layout)
           // Activate constaints
         explorCv.translatesAutoresizingMaskIntoConstraints = false
           return explorCv
       }()
    
    var investBLable: UILabel = {
        $0.text = "استثمر في البلد"
        $0.textColor = .red
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    var allIButton : UIButton = {
        //      cancelBtn.frame = CGRect(x: 30, y: 50, width: 60, height: 50)
        $0.setTitle("الكل", for: .normal)
        $0.setTitleColor(.link , for: .normal)
        $0.layer.cornerRadius = 10
        $0.tag = 2
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector (clickedBtn), for: .touchDown)
        return $0
    }(UIButton())
    
    let investCollectionView: UICollectionView = {
        // init the layout
        let layout = UICollectionViewFlowLayout()
        // set the direction to be horizontal
        layout.scrollDirection = .horizontal
        // the instance of collectionView
        let investCv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        // Activate constaints
        investCv.translatesAutoresizingMaskIntoConstraints = false
        return investCv
    }()
    
    
    var eventsBLable: UILabel = {
        $0.text = "الفعاليات"
        $0.textColor = .red
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    var allEButton : UIButton = {
        //cancelBtn.frame = CGRect(x: 30, y: 50, width: 60, height: 50)
        $0.setTitle("الكل", for: .normal)
        $0.setTitleColor(.link , for: .normal)
        $0.layer.cornerRadius = 10
        $0.tag = 3
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector (clickedBtn), for: .touchDown)
        return $0
    }(UIButton())
    
    let eventsCollectionView: UICollectionView = {
        // init the layout
        let layout = UICollectionViewFlowLayout()
        // set the direction to be horizontal
        layout.scrollDirection = .horizontal
        // the instance of collectionView
        let investCv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        // Activate constaints
        investCv.translatesAutoresizingMaskIntoConstraints = false
        return investCv
    }()
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(mainImage)
        view.addSubview(explorBLable)
        view.addSubview(allButton)
        view.addSubview(investBLable)
        view.addSubview(allIButton)
        view.addSubview(eventsBLable)
        view.addSubview(allEButton)
       
        setUpUI()
        setupSubCells()

    }
    
    
    
    private func setUpUI(){[mainImage,explorBLable,investBLable,eventsBLable].forEach{view.addSubview($0)}
        
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20),
            mainImage.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            mainImage.heightAnchor.constraint(equalToConstant: 150),
            mainImage.widthAnchor.constraint(equalToConstant: 300),
            mainImage.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
            
            explorBLable.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 20),
            explorBLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 5),
            explorBLable.heightAnchor.constraint(equalToConstant: 30),
            explorBLable.widthAnchor.constraint(equalToConstant: 120),

            allButton.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 20),
            allButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            allButton.heightAnchor.constraint(equalToConstant: 30),
            allButton.widthAnchor.constraint(equalToConstant: 120),
            
            investBLable.topAnchor.constraint(equalTo: explorBLable.bottomAnchor, constant: 150),
            investBLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 5),
            investBLable.heightAnchor.constraint(equalToConstant: 30),
            investBLable.widthAnchor.constraint(equalToConstant: 120),
            
            allIButton.topAnchor.constraint(equalTo: explorBLable.bottomAnchor, constant: 150),
            allIButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            allIButton.heightAnchor.constraint(equalToConstant: 30),
            allIButton.widthAnchor.constraint(equalToConstant: 120),
            
            eventsBLable.topAnchor.constraint(equalTo: investBLable.bottomAnchor,constant: 150),
            eventsBLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 5),
            eventsBLable.heightAnchor.constraint(equalToConstant: 30),
            eventsBLable.widthAnchor.constraint(equalToConstant: 100),
            
            allEButton.topAnchor.constraint(equalTo: investBLable.bottomAnchor,constant: 150),
            allEButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            allEButton.heightAnchor.constraint(equalToConstant: 30),
            allEButton.widthAnchor.constraint(equalToConstant: 120)
            
    
        ])
    }


    
    
    
    
    @objc func clickedBtn(_ btn: UIButton) {
        if btn.tag == 1 {
           let vc = ExplorAlbaladVC()
            present(vc, animated: true, completion: nil)
        }else if btn.tag == 2 {
            let vc = InvestmentsAlbaladVC()
            present(vc, animated: true, completion: nil)
        }else if btn.tag == 3 {
            let vc = EventAlbaladVC()
            present(vc, animated: true, completion: nil)
        }
    }
    
    fileprivate func setupSubCells(){
        // add collectionView to the view
        view.addSubview(explorCollectionView)
        
        explorCollectionView.register(ExplorCVCell.self, forCellWithReuseIdentifier: ExplorCVCell.identifier)
 
        explorCollectionView.dataSource = self
        explorCollectionView.delegate = self
        // setup constrainst
        // make it fit all the space of the CustomCell
        explorCollectionView.topAnchor.constraint(equalTo: explorBLable.bottomAnchor).isActive = true
        explorCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        explorCollectionView.bottomAnchor.constraint(equalTo: investBLable.topAnchor).isActive = true
        explorCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        // add second collectionView to the view
        view.addSubview(investCollectionView)
        
        investCollectionView.register(ExplorCVCell.self, forCellWithReuseIdentifier: ExplorCVCell.identifier)
 
        investCollectionView.dataSource = self
        investCollectionView.delegate = self
        // setup constrainst
        // make it fit all the space of the CustomCell
        investCollectionView.topAnchor.constraint(equalTo: investBLable.bottomAnchor).isActive = true
        investCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        investCollectionView.bottomAnchor.constraint(equalTo: eventsBLable.topAnchor).isActive = true
        investCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        // add third collectionView to the view
        view.addSubview(eventsCollectionView)
        
        eventsCollectionView.register(ExplorCVCell.self, forCellWithReuseIdentifier: ExplorCVCell.identifier)
 
        eventsCollectionView.dataSource = self
        eventsCollectionView.delegate = self
        // setup constrainst
        // make it fit all the space of the CustomCell
        eventsCollectionView.topAnchor.constraint(equalTo: eventsBLable.bottomAnchor).isActive = true
        eventsCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        eventsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -20).isActive = true
        eventsCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
}
    
    
    extension MainPageVC :  UICollectionViewDelegate , UICollectionViewDataSource {
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = explorCollectionView.dequeueReusableCell(withReuseIdentifier: ExplorCVCell.identifier, for: indexPath) as! ExplorCVCell
        
        cell.explorImg.image = UIImage(systemName: "heart")
        return cell
    }
        
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
              
            let vc = ExplorAlbaladVC()
            
//          vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        }
     
        
    }
        
        extension MainPageVC: UICollectionViewDelegateFlowLayout {
            
            func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                
                return CGSize(width: collectionView.frame.size.width/3, height: collectionView.frame.size.height/2)
                
            }
          

        }
        
        
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//            
//            let width = view.frame.height / 2
//            let height = view.frame.height / 2
//            
//            return CGSize(width: width, height: height)
//            
//        }
        

    


 
