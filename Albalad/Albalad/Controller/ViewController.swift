//
//  ViewController.swift
//  Albalad
//
//  Created by Nora on 02/06/1443 AH.
//

import UIKit

class ViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc = MainPageVC()
        let vc2 = ReservationVC()
        let vc3 = ProfileVC()
        let vc4 = MapViewController()
        
        
        vc.title = "الرئيسية"
        vc2.title = "حجوزاتي"
        vc3.title = "الملف الشخصي"
        vc4.title = "الخريطة"
        
        
        self.setViewControllers([vc3,vc2,vc4,vc], animated: false)
        
        guard let items = self.tabBar.items else { return }
        
        
        
        let images = ["person.circle","ticket","map","house"]
        
        for x in 0...3 {
            items[x].image = UIImage(systemName: images[x])
        }

        self.tabBar.tintColor = #colorLiteral(red: 0.2183634341, green: 0.4241205454, blue: 0.4433012903, alpha: 0.5)
        self.tabBar.isTranslucent = false
        self.tabBar.backgroundColor = .white
        self.selectedIndex = 3
    }
    
    
}


