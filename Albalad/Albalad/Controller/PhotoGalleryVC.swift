//
//  PhotoGalleryVC.swift
//  Albalad
//
//  Created by Nora on 17/06/1443 AH.
//

import UIKit

class PhotoGalleryVC: UIViewController {

    
    var photosArray = [
        UIImage(named: "1")!,
        UIImage(named: "2")!,
        UIImage(named: "3")!,
        UIImage(named: "4")!,
        UIImage(named: "5")!,
        UIImage(named: "6")!,
        UIImage(named: "7")!,
        UIImage(named: "8")!,
        UIImage(named: "9")!,
        UIImage(named: "10")!,
        UIImage(named: "11")!,
        UIImage(named: "12")!,
        UIImage(named: "13")!,
        UIImage(named: "14")!,
        UIImage(named: "15")!,
        UIImage(named: "16")!,
        UIImage(named: "بيت الشربتلي")!,
        UIImage(named: "خلفية")!,
        UIImage(named: "معلم")!]
    
    var photoLable: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "معرض الصور"
        $0.font = UIFont(name: "GillSans-Italic", size: 25)
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
    
    var subView : UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOffset = CGSize(width: 5, height: 5)
        $0.layer.shadowOpacity = 0.7
        $0.layer.shadowRadius = 10.0
        return $0
    }(UIView())
    
    var photoCollectionView : UICollectionView = {
        let layout = PinterestLayout()
        let explorCv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        explorCv.translatesAutoresizingMaskIntoConstraints = false
        return explorCv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setUp()
        
    }
    

    
    fileprivate func setUp(){
        
        if let layout = photoCollectionView.collectionViewLayout as? PinterestLayout {
          layout.delegate = self
        }
        view.addSubview(subView)
        subView.addSubview(photoLable)
        view.addSubview(backButton)
        view.addSubview(photoCollectionView)

        photoCollectionView.register(PhotoGalleryCell.self, forCellWithReuseIdentifier: PhotoGalleryCell.identifier)
        
        
        photoCollectionView.dataSource = self
        photoCollectionView.delegate = self
        
        
        NSLayoutConstraint.activate([
            
            
            subView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            subView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20),
            backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -15),
            
            photoLable.topAnchor.constraint(equalTo: subView.topAnchor),
            photoLable.centerXAnchor.constraint(equalTo: subView.centerXAnchor),
            
            photoCollectionView.topAnchor.constraint(equalTo: photoLable.topAnchor,constant: 40),
            photoCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            photoCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            photoCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            
        ])
    }
    
    @objc func backBtn() {
        dismiss(animated: true)
    }

}

extension PhotoGalleryVC :  UICollectionViewDelegate , UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = photoCollectionView.dequeueReusableCell(withReuseIdentifier: PhotoGalleryCell.identifier, for: indexPath) as! PhotoGalleryCell
        
        cell.Img.image = photosArray[indexPath.item]
        
        return cell
    }
    
    
}


extension PhotoGalleryVC: PinterestLayoutDelegate {
    

    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        
        return photosArray[indexPath.item].size.height / 2.5

    }
 
    
}
