//
//  EventReservationVC.swift
//  Albalad
//
//  Created by Nora on 17/06/1443 AH.
//

import UIKit
import Firebase

class EventReservationVC: UIViewController {

    
    let db = Firestore.firestore()

    var eventNameSelected = 0

    let tranView = UIView()
    let tableView = UITableView()
    var button1 = UIButton()
    var dataSource = [String]()
    let datePiicker = UIDatePicker()
    let timePiicker = UIDatePicker()


    var reservLable: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "تأكيد الحجز"
        $0.font = UIFont(name: "GillSans-Italic", size: 25)
        $0.textColor = .black
        return $0
    }(UILabel())


    var reservView : UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = #colorLiteral(red: 0.2183634341, green: 0.4241205454, blue: 0.4433012903, alpha: 0.2)
        $0.layer.cornerRadius = 15
        return $0
    }(UIView())

    var nameLable: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
        return $0
    }(UILabel())


    var dateRes: UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.placeholder = "اختر التاريخ"
        $0.borderStyle = .roundedRect
        $0.textColor = .black
        return $0
    }(UITextField())

    var timeRes: UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.placeholder = "اختر الوقت"
        $0.borderStyle = .roundedRect
        $0.textColor = .black
        return $0
    }(UITextField())

    var priceLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .right
        $0.textColor = .black
        $0.numberOfLines = 0
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return $0
    }(UILabel())

    var reservBtn : UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("تأكيد الحجز", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = #colorLiteral(red: 0.2183634341, green: 0.4241205454, blue: 0.4433012903, alpha: 0.5)
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector (reservedBtn), for: .touchDown)
        return $0
    }(UIButton())

    var cancelBtn : UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("إلغاء", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = #colorLiteral(red: 0.2183634341, green: 0.4241205454, blue: 0.4433012903, alpha: 0.5)
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector (canceledBtn), for: .touchDown)
        return $0
    }(UIButton())



    func setUp(){


        view.addSubview(reservLable)
        view.addSubview(reservView)
        view.addSubview(reservBtn)
        reservView.addSubview(nameLable)
        reservView.addSubview(dateRes)
        reservView.addSubview(timeRes)
        reservView.addSubview(priceLabel)
        view.addSubview(reservBtn)
        view.addSubview(cancelBtn)


        NSLayoutConstraint.activate([

            reservLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            reservLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            reservLable.heightAnchor.constraint(equalToConstant: 30),

            reservView.topAnchor.constraint(equalTo: reservLable.bottomAnchor, constant: 80),
            reservView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            reservView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            reservView.heightAnchor.constraint(equalToConstant: 200),

            nameLable.topAnchor.constraint(equalTo: reservView.topAnchor,constant: 10),
            nameLable.trailingAnchor.constraint(equalTo: reservView.trailingAnchor),
            nameLable.widthAnchor.constraint(equalToConstant: 100),
            nameLable.heightAnchor.constraint(equalToConstant: 20),

            dateRes.topAnchor.constraint(equalTo: nameLable.topAnchor,constant: 30),
            dateRes.centerXAnchor.constraint(equalTo: reservView.centerXAnchor),
            dateRes.widthAnchor.constraint(equalToConstant: 280),
            dateRes.heightAnchor.constraint(equalToConstant: 30),

            timeRes.topAnchor.constraint(equalTo: dateRes.bottomAnchor,constant: 30),
            timeRes.centerXAnchor.constraint(equalTo: reservView.centerXAnchor),
            timeRes.widthAnchor.constraint(equalToConstant: 280),
            timeRes.heightAnchor.constraint(equalToConstant: 30),

            priceLabel.topAnchor.constraint(equalTo: timeRes.bottomAnchor,constant: 5),

            priceLabel.widthAnchor.constraint(equalToConstant: 280),
            priceLabel.heightAnchor.constraint(equalToConstant: 30),
            priceLabel.bottomAnchor.constraint(equalTo: reservView.bottomAnchor),


            reservBtn.topAnchor.constraint(equalTo: reservView.bottomAnchor, constant: 80),
            reservBtn.heightAnchor.constraint(equalToConstant: 50),
            reservBtn.widthAnchor.constraint(equalToConstant: 100),
            reservBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -50),

            cancelBtn.topAnchor.constraint(equalTo: reservView.bottomAnchor, constant: 80),
            cancelBtn.heightAnchor.constraint(equalToConstant: 50),
            cancelBtn.widthAnchor.constraint(equalToConstant: 100),
            cancelBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50)


        ])
    }






    func createDatePicker(){

        dateRes.textAlignment = .center
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressd))
        let flexSpce = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: #selector(donePressd))

        toolbar.setItems([flexSpce,doneBtn], animated: true)
        datePiicker.frame.size = CGSize(width: 0, height: 250)
        dateRes.inputAccessoryView = toolbar
        dateRes.inputView = datePiicker
        datePiicker.datePickerMode = .date
        datePiicker.preferredDatePickerStyle = .inline
        datePiicker.backgroundColor = .white

    }

    @objc func donePressd(){

        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.dateStyle = .none
        dateRes.text = "\(datePiicker.date)"
        self.view.endEditing(true)

    }

    func createTimePicker(){

        timeRes.textAlignment = .center
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneePressd))
        let flexSpcee = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: #selector(donePressd))

        toolbar.setItems([flexSpcee,doneBtn], animated: true)
        timePiicker.frame.size = CGSize(width: 0, height: 250)
        timeRes.inputAccessoryView = toolbar
        timeRes.inputView = timePiicker
        timePiicker.datePickerMode = .time
        //        timePiicker.preferredDatePickerStyle = .inline
        timePiicker.preferredDatePickerStyle = .wheels

        timePiicker.backgroundColor = .white

    }

    @objc func doneePressd(){

        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.dateStyle = .none
        timeRes.text = "\(timePiicker.date)"
        self.view.endEditing(true)

    }


    func addReservation(){

        if Auth.auth().currentUser?.uid != nil {

            db.collection("Reservation").document(Auth.auth().currentUser!.uid).setData(
                ["id":Auth.auth().currentUser!.uid,
                 "name": self.nameLable.text!,
                 "time": self.timeRes.text!,
                 "date": self.dateRes.text!,
                 "price": self.priceLabel.text!
                ])
        }
    }




    @objc func reservedBtn() {
        addReservation()
        let vc = PaymentAlbaladVC()
        present(vc, animated: true, completion: nil)
    }

    @objc func canceledBtn() {
        dismiss(animated: true, completion: nil)
    }



    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        createDatePicker()
        createTimePicker()
        setUp()

        if eventNameSelected == 0 {
            nameLable.text = "مهرجان البحر لأحمر"
            priceLabel.text = "١٠٠ريال"

        }else if eventNameSelected == 1 {
            nameLable.text = "إقامة فنية"
            priceLabel.text = "١٢٠ريال"

        }else if eventNameSelected == 2 {
            nameLable.text = "جولة في البلد"
            priceLabel.text = "١٥٠ريال"

        }else if eventNameSelected == 3 {
            nameLable.text = "متحف الضيافة"
            priceLabel.text = "١٠ريال"

        }

    }
}

