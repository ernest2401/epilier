//
//  personInformationViewController.swift
//  Epilier
//
//  Created by Ernest Migranov on 07.10.2021.
//

import Foundation
import UIKit
import Alamofire

class PersonInformationViewController: UIViewController {
    
    var headers: HTTPHeaders = []
    
    lazy var nameLabel = UIButton()
    lazy var phoneLabel = UIButton()
    lazy var extraPhoneLabel = UIButton()
    lazy var birthdayLabel = UIButton()
    lazy var genderLabel = UIButton()
    
    let nameField: UITextField = {
        let textField = UITextField()
        textField.attributedText = NSAttributedString(string: "Vasya")
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 17)
        return textField
    }()
    
    let phoneField: UITextField = {
        let textField = UITextField()
        textField.attributedText = NSAttributedString(string: "Vasya")
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 17)
        return textField
    }()
    let extraPhoneField: UITextField = {
        let textField = UITextField()
        textField.attributedText = NSAttributedString(string: "Vasya")
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 17)
        return textField
    }()
    let birthdayField: UITextField = {
        let textField = UITextField()
        textField.attributedText = NSAttributedString(string: "Vasya")
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 17)
        return textField
    }()
    
    let genderField: UITextField = {
        let textField = UITextField()
        textField.attributedText = NSAttributedString(string: "Vasya")
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 17)
        return textField
    }()
    
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
        network()
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
        let textFields = [nameField,phoneField,extraPhoneField,birthdayField,genderField]
        for item in 0 ... massive.count - 1{
            let helloLabel: UILabel = {
                let label = UILabel()
                label.font = UIFont.systemFont(ofSize: 12)
                label.text = textArray[item]
                label.textColor = .gray
                return label
            }()

            massive[item].addSubview(helloLabel)
            massive[item].addSubview(textFields[item])
            helloLabel.translatesAutoresizingMaskIntoConstraints = false
            helloLabel.topAnchor.constraint(equalTo: massive[item].topAnchor, constant: 5).isActive = true
            helloLabel.leadingAnchor.constraint(equalTo: massive[item].leadingAnchor, constant: 10).isActive = true
            textFields[item].topAnchor.constraint(equalTo: helloLabel.bottomAnchor, constant: 5).isActive = true
            textFields[item].leadingAnchor.constraint(equalTo: massive[item].leadingAnchor, constant: 10).isActive = true
            textFields[item].bottomAnchor.constraint(equalTo: massive[item].bottomAnchor, constant: -10).isActive = true
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
    
    func refreshFields(name: String,phone: String,extraPhone: String?,birthday: String?,gender: String?){
        nameField.attributedText = NSAttributedString(string: name)
        phoneField.attributedText = NSAttributedString(string: phone)
        extraPhoneField.attributedText = NSAttributedString(string: extraPhone ?? "Не заполнено")
        birthdayField.attributedText = NSAttributedString(string: birthday ?? "Не заполнено")
        genderField.attributedText = NSAttributedString(string: gender ?? "Не заполнено")
    }
}

extension PersonInformationViewController{
    func network(){
        headers = [.authorization(bearerToken: token_mobile)]
        let url = "mobile/user"
        
        let request = AF.request(baseURL + url, method: .get, headers: headers)
        
        request.responseDecodable(of: Response.self){ (response) in
            guard let data = response.value else { return }
            print(data.response.name)
            self.refreshFields(name: data.response.name, phone: data.response.phone, extraPhone: data.response.second_phone, birthday: data.response.birth_date, gender: data.response.gender)
        }
    }
}

struct Response: Decodable{
    var response: User
}

struct User: Decodable{
    var name: String
    var phone: String
    var second_phone: String?
    var gender: String?
    var birth_date: String?
}
