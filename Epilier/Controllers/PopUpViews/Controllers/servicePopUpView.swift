//
//  ChildViewController.swift
//  FluidTransition
//
//  Created by Mikhail Rubanov on 07/07/2019.
//  Copyright © 2019 akaDuality. All rights reserved.
//

import UIKit

class servicePopUpView: UIViewController {
    
    lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "dismissButton"), for: .normal)
        button.addTarget(self, action: #selector(dismissSelf), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var chooseButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor(hexString: "#C8EFF4")
        button.setTitle("Сменить студию", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(dismissSelf), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var imageLocation: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "location")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var signUpLabel: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitle("Epilier на ул.Павлюхина,25", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var mapButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.backgroundColor = UIColor(hexString: "#DCDCDC")
        button.setTitle("Проложить маршрут", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    lazy var timeLabel: UIButton = {
        let button = UIButton()
        button.setTitleColor(.gray, for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.setTitle("Ближаший сеанс", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var timeLabelAnswer: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.setTitle("12 сен в 12.00", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var workingHours: UIButton = {
        let button = UIButton()
        button.setTitleColor(.gray, for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.setTitle("Режим работы", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var workingHoursAnswer: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.setTitle("Пн. -Вс. 10:00-20:00", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var masters: UIButton = {
        let button = UIButton()
        button.setTitleColor(.gray, for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.setTitle("Косметологов", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var mastersAnswer: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.setTitle("6", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var phone: UIButton = {
        let button = UIButton()
        button.setTitleColor(.gray, for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.setTitle("Телефон", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var phoneAnswer: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.setTitle("6", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.layer.cornerRadius = 24
        addSubViews()
        setConstraints()
    }
    
    func addSubViews(){
        self.view.addSubview(dismissButton)
        self.view.addSubview(chooseButton)
        self.view.addSubview(imageLocation)
        self.view.addSubview(signUpLabel)
        self.view.addSubview(mapButton)
        self.view.addSubview(timeLabel)
        self.view.addSubview(timeLabelAnswer)
        self.view.addSubview(workingHours)
        self.view.addSubview(workingHoursAnswer)
        self.view.addSubview(masters)
        self.view.addSubview(mastersAnswer)
        self.view.addSubview(phone)
        self.view.addSubview(phoneAnswer)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            dismissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dismissButton.topAnchor.constraint(equalTo: view.topAnchor),
            dismissButton.widthAnchor.constraint(equalToConstant: 150),
            dismissButton.heightAnchor.constraint(equalToConstant: 30),
            
            chooseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chooseButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -35),
            chooseButton.widthAnchor.constraint(equalToConstant: 300),
            chooseButton.heightAnchor.constraint(equalToConstant: 40),
            imageLocation.topAnchor.constraint(equalTo: view.topAnchor,constant: 35),
            imageLocation.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            imageLocation.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -345),
            signUpLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 35),
            signUpLabel.leadingAnchor.constraint(equalTo: imageLocation.trailingAnchor, constant: 20),
            mapButton.topAnchor.constraint(equalTo: signUpLabel.bottomAnchor, constant: 10),
            mapButton.leadingAnchor.constraint(equalTo: imageLocation.trailingAnchor, constant: 20),
            mapButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -160),
            timeLabel.topAnchor.constraint(equalTo: mapButton.bottomAnchor, constant: 20),
            timeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            timeLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.45),
            timeLabelAnswer.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 1),
            timeLabelAnswer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            timeLabelAnswer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.45),
            workingHours.topAnchor.constraint(equalTo: mapButton.bottomAnchor, constant: 20),
            workingHours.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 15),
            workingHours.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.45),
            workingHoursAnswer.topAnchor.constraint(equalTo: workingHours.bottomAnchor, constant: 1),
            workingHoursAnswer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 15),
            workingHoursAnswer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.45),
            masters.topAnchor.constraint(equalTo: timeLabelAnswer.bottomAnchor, constant: 5),
            masters.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            masters.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.45),
            mastersAnswer.topAnchor.constraint(equalTo: masters.bottomAnchor, constant: 1),
            mastersAnswer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            mastersAnswer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.45),
            phone.topAnchor.constraint(equalTo: workingHoursAnswer.bottomAnchor, constant: 5),
            phone.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 15),
            phone.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.45),
            phoneAnswer.topAnchor.constraint(equalTo: phone.bottomAnchor, constant: 1),
            phoneAnswer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 15),
            phoneAnswer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.45),
            
            ])
    }
    
    @objc func dismissSelf() {
        self.dismiss(animated: true)
    }
}
