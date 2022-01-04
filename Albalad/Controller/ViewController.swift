//
//  ViewController.swift
//  Albalad
//
//  Created by Nora on 28/05/1443 AH.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       // create instance of view controllers
        let vc = MainPageVC()
        let vc2 = SignUpVC()
        let vc3 = LoginVC()
        
        
       //set title
        vc.title = "Home"
        vc2.title = "Fav"
        vc3.title = "Fav"
        
       // assign view controllers of tab bar
        self.setViewControllers([vc,vc2,vc3], animated: false)
        
        
        guard let items = self.tabBar.items else { return }
    
                
        
        let images = ["house","star","star"]
        
        for x in 0...2 {
            items[x].image = UIImage(systemName: images[x])
        }
      // changing tint color
        self.tabBar.tintColor = .black
        self.tabBar.isTranslucent = false
        self.tabBar.backgroundColor = .lightGray
    }


    
}

