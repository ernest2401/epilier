//
//  personInformationViewController.swift
//  Epilier
//
//  Created by Ernest Migranov on 07.10.2021.
//

import Foundation
import UIKit

class PersonInformationViewController: UIViewController {
    
    lazy var nameLabel = UIButton()
    lazy var phoneLabel = UIButton()
    lazy var extraPhoneLabel = UIButton()
    lazy var birthdayLabel = UIButton()
    lazy var genderLabel = UIButton()
    
    lazy var verticalStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            nameLabel,
            phoneLabel,
            extraPhoneLabel,
            birthdayLabel,
            genderLabel,
        ])
        sv.axis = .vertical
        sv.spacing = 20
        sv.distribution = .fillEqually
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        detailingNavigationBar()
        creatingButtons()
        detailingButtons()
        self.view.addSubview(verticalStackView)
        setConstraints()
        
    }
    func detailingNavigationBar(){
        let saveItem = UIBarButtonItem()
        saveItem.title = "Сохранить"
        
        self.navigationItem.rightBarButtonItem = saveItem
        self.navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    func creatingButtons(){
        let massive = [nameLabel,phoneLabel,extraPhoneLabel,birthdayLabel,genderLabel]
        for item in massive{
            //item.layer.masksToBounds = true
            item.layer.cornerRadius = 10
            item.translatesAutoresizingMaskIntoConstraints = false
            //button.setImage(UIImage(named: "reviewsButton"), for: .normal)
            item.backgroundColor = UIColor.white
            item.layer.shadowColor = UIColor.black.cgColor
            item.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
            item.layer.shadowOpacity = 0.1
            item.layer.shadowRadius = 10
            item.contentMode = .scaleAspectFit
        }
    }
    
    func detailingButtons(){
        let massive = [nameLabel,phoneLabel,extraPhoneLabel,birthdayLabel,genderLabel]
        let textArray = ["ФИО","Телефон","Дополнтельный телефон","Дата рождения","Пол"]
        for item in 0 ... massive.count - 1{
            let helloLabel: UILabel = {
                let label = UILabel()
                //label.font = UIFont(name: "SF Pro Text", size: 17)
                label.font = UIFont.systemFont(ofSize: 12)
                label.text = textArray[item]
                label.textColor = .gray
                return label
            }()
            let textField = UITextField()
            textField.attributedText = NSAttributedString(string: "Vasya")
            textField.font = UIFont.systemFont(ofSize: 17)
            self.view.addSubview(textField)
            massive[item].addSubview(helloLabel)
            massive[item].addSubview(textField)
            helloLabel.translatesAutoresizingMaskIntoConstraints = false
            textField.translatesAutoresizingMaskIntoConstraints = false
            helloLabel.topAnchor.constraint(equalTo: massive[item].topAnchor, constant: 10).isActive = true
            helloLabel.leadingAnchor.constraint(equalTo: massive[item].leadingAnchor, constant: 10).isActive = true
            textField.topAnchor.constraint(equalTo: helloLabel.bottomAnchor, constant: 10).isActive = true
            textField.leadingAnchor.constraint(equalTo: massive[item].leadingAnchor, constant: 10).isActive = true
            //textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        }
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 115),
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            verticalStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -350),
        ])
    }
}
