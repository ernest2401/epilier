//
//  signUpPopUpView.swift
//  Epilier
//
//  Created by Ernest Migranov on 01.10.2021.
//

import Foundation
import UIKit

class SignUpPopUpView: UIViewController{
    
    lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "dismissButton"), for: .normal)
        button.addTarget(self, action: #selector(dismissSelf), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var signUpLabel: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor(hexString: "#C8EFF4")
        label.textColor = .black
        label.text = "Записаться"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var firstButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.white
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        button.layer.shadowOpacity = 0.2
        button.layer.shadowRadius = 2
        return button
    }()
    
    lazy var secondButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.white
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        button.layer.shadowOpacity = 0.2
        button.layer.shadowRadius = 20
        return button
    }()
    
    lazy var thirdButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.white
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        button.layer.shadowOpacity = 0.2
        button.layer.shadowRadius = 20
        return button
    }()
    
    lazy var buttonsStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            firstButton,
            secondButton,
            thirdButton
        ])
        sv.axis = .vertical
        sv.spacing = 10
        sv.distribution = .fillEqually
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    lazy var firstLabelInfo: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor(hexString: "#C8EFF4")
        label.font = UIFont(name: "SF Pro Text", size: 17)
        label.text = "На услугу"
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var secondLabelInfo: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor(hexString: "#C8EFF4")
        label.font = UIFont(name: "SF Pro Text", size: 17)
        label.text = "К мастеру"
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var thirdLabelInfo: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor(hexString: "#C8EFF4")
        label.font = UIFont(name: "SF Pro Text", size: 17)
        label.text = "Повторно"
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var firstDescription: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor(hexString: "#C8EFF4")
        label.font = UIFont(name: "SF Pro Text", size: 14)
        label.textColor = .gray
        label.text = "Выберите из множества услуг нашей студии"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var secondDescription: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor(hexString: "#C8EFF4")
        label.font = UIFont(name: "SF Pro Text", size: 14)
        label.textColor = .gray
        label.text = "Если вы знаете к какому именно мастеру хотите попасть"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var thirdDescription: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor(hexString: "#C8EFF4")
        label.font = UIFont(name: "SF Pro Text", size: 14)
        label.textColor = .gray
        label.text = "Повторите услугу, на которую записывались уже ранее"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        self.view.addSubview(dismissButton)
        self.view.addSubview(signUpLabel)
        self.view.addSubview(buttonsStackView)
        self.firstButton.addSubview(firstLabelInfo)
        self.secondButton.addSubview(secondLabelInfo)
        self.thirdButton.addSubview(thirdLabelInfo)
        self.firstButton.addSubview(firstDescription)
        self.secondButton.addSubview(secondDescription)
        self.thirdButton.addSubview(thirdDescription)
        setConstraints()
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            dismissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dismissButton.topAnchor.constraint(equalTo: view.topAnchor),
            dismissButton.widthAnchor.constraint(equalToConstant: 150),
            dismissButton.heightAnchor.constraint(equalToConstant: 30),
            signUpLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            signUpLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            buttonsStackView.topAnchor.constraint(equalTo: signUpLabel.bottomAnchor, constant: 15),
            buttonsStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            buttonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            firstLabelInfo.leadingAnchor.constraint(equalTo: firstButton.leadingAnchor, constant: 10),
            firstLabelInfo.topAnchor.constraint(equalTo: firstButton.topAnchor, constant: 15),
            secondLabelInfo.leadingAnchor.constraint(equalTo: secondButton.leadingAnchor, constant: 10),
            secondLabelInfo.topAnchor.constraint(equalTo: secondButton.topAnchor, constant: 15),
            thirdLabelInfo.leadingAnchor.constraint(equalTo: thirdButton.leadingAnchor, constant: 10),
            thirdLabelInfo.topAnchor.constraint(equalTo: thirdButton.topAnchor, constant: 15),
            firstDescription.leadingAnchor.constraint(equalTo: firstButton.leadingAnchor, constant: 10),
            firstDescription.topAnchor.constraint(equalTo: firstLabelInfo.topAnchor, constant: 20),
            firstDescription.trailingAnchor.constraint(equalTo: firstButton.trailingAnchor, constant: -10),
            secondDescription.leadingAnchor.constraint(equalTo: secondButton.leadingAnchor, constant: 10),
            secondDescription.topAnchor.constraint(equalTo: secondLabelInfo.topAnchor, constant: 20),
            secondDescription.trailingAnchor.constraint(equalTo: secondButton.trailingAnchor, constant: -10),
            thirdDescription.leadingAnchor.constraint(equalTo: thirdButton.leadingAnchor, constant: 10),
            thirdDescription.trailingAnchor.constraint(equalTo: thirdButton.trailingAnchor, constant: -10),
            thirdDescription.topAnchor.constraint(equalTo: thirdLabelInfo.topAnchor, constant: 20),
        ])
        
        
    }
    
    @objc func dismissSelf() {
        self.dismiss(animated: true)
    }
}
