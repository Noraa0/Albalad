//
//  LaunchScreen.swift
//  Albalad
//
//  Created by Nora on 11/06/1443 AH.
//

import UIKit

class LaunchScreen: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(appImage)
       
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        appImage.center = view.center
        view.backgroundColor = #colorLiteral(red: 0.880281508, green: 0.8669131398, blue: 0.8231617808, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: .now()+0.9, execute: {
                        self.animate()
        })
    }
    
    // i did organized all views in Closures
    
    let appImage : UIImageView = {
        let myImage = UIImageView()
        myImage.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        myImage.image = UIImage(named: "Icon-App-83.5x83.5")
        return myImage
    }()
    
    private func animate() {
        UIView.animate(withDuration: 3, animations: {
            let size = self.view.frame.size.width * 3
            let diffX = size - self.view.frame.size.width
            let diffY = self.view.frame.size.height - size
            self.appImage.frame = CGRect(
                x: -(diffX/2),
                y: diffY/2,
                width: size,
                height: size
            )
        })
        UIView.animate(withDuration: 1, animations: {
            self.appImage.alpha = 0
        }, completion: { done in
            if done {
                DispatchQueue.main.asyncAfter(deadline: .now()+0.1, execute: {
                    let vc = ViewController()
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                })
            }
        })
 
}
}

