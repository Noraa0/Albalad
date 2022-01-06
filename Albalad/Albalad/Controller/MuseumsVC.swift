//
//  MuseumsVC.swift
//  Albalad
//
//  Created by Nora on 02/06/1443 AH.
//

import UIKit

class MuseumsVC: UIViewController , UISearchBarDelegate {

    //    private let db = Firestore.firestore()
    //       private var hotels : [Hotel] = []
    //       let userStore = Auth.auth().currentUser
    
    var museumName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        uiSettengs()
    }
    
    lazy var searchBar:UISearchBar = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.searchBarStyle = UISearchBar.Style.default
        $0.placeholder = "Search..."
        $0.sizeToFit()
        $0.isTranslucent = false
        $0.delegate = self
        $0.backgroundImage = UIImage()
        return $0
    }(UISearchBar())
    
    lazy var tableView : UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(MuseumAlbaladCell.self, forCellReuseIdentifier: MuseumAlbaladCell.id)
        $0.rowHeight = UITableView.automaticDimension
        $0.estimatedRowHeight = 200
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.delegate = self
        $0.dataSource = self
        $0.layer.cornerRadius = 10
        return $0
    }(UITableView())
    
    func uiSettengs(){
        [searchBar,tableView].forEach{view.addSubview($0)}
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    //    func readHotel(){
    //
    //            let name = db.collection("Stores").whereField( "userID", isEqualTo: userStore as Any).addSnapshotListener{(querySnapshot, err) in
    //                if let err = err {
    //                    print("Error getting documents: \(err)")
    //                } else {
    //
    //                    for document in querySnapshot!.documents {
    //                        let data = document.data()
    //                        self.userStoreName = data["userID"] as! String
    //                        print("Name," , self.userStoreName)
    //                    }
    //                }
    //            }
    //        }
}
extension MuseumsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MuseumAlbaladCell.id, for: indexPath) as! MuseumAlbaladCell
        cell.museumName.text = "museum"
        //cell.storeEmail.text = stores[indexPath.row].storeEmail
        return cell
    }
}

