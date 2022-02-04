//
//  RegistrationViewController.swift
//  Epilier
//
//  Created by Ernest Migranov on 22.10.2021.
//

import UIKit
import Alamofire

class RegistrationViewController: UIViewController {
    
    var gender = ""
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        //button.setTitle("Перейти на экран", for: .normal)
        button.setImage(UIImage(named: "close"), for: .normal)
        button.addTarget(self, action: #selector(closeFunc), for: .touchUpInside)
        return button
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Далее", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(nextFunc), for: .touchUpInside)
        return button
    }()
    
    lazy var nameLabel = UIButton()
    lazy var phoneLabel = UIButton()
    lazy var extraPhoneLabel = UIButton()
    lazy var passwordLabel = UIButton()
    lazy var extraPasswordLabel = UIButton()
    lazy var birthdayLabel = UIButton()
    lazy var genderLabel = UIButton()
    
    lazy var verticalStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            nameLabel,
            phoneLabel,
            extraPhoneLabel,
            passwordLabel,
            extraPasswordLabel,
            birthdayLabel,
            genderLabel,
        ])
        sv.axis = .vertical
        sv.spacing = 20
        sv.distribution = .fillEqually
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let nameField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите имя"
        textField.font = UIFont.systemFont(ofSize: 17)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let phoneField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите телефон"
        textField.font = UIFont.systemFont(ofSize: 17)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let extraPhoneField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите дополнительный телефон"
        textField.font = UIFont.systemFont(ofSize: 17)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите пароль"
        textField.font = UIFont.systemFont(ofSize: 17)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let extraPasswordField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Повторите пароль"
        textField.font = UIFont.systemFont(ofSize: 17)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let birthdayField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите дату рождения"
        textField.font = UIFont.systemFont(ofSize: 17)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.view.addSubview(closeButton)
        self.view.addSubview(nextButton)
        self.view.addSubview(verticalStackView)
        self.view.addSubview(nameField)
        self.view.addSubview(phoneField)
        self.view.addSubview(extraPhoneField)
        self.view.addSubview(passwordField)
        self.view.addSubview(extraPasswordField)
        self.view.addSubview(birthdayField)
        setConstraints()
        creatingButtons()
        detailingButtons()
        
    }
    func creatingButtons(){
        let massive = [nameLabel,phoneLabel,extraPhoneLabel,passwordLabel,extraPasswordLabel,birthdayLabel,genderLabel]
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
        let massive = [nameLabel,phoneLabel,extraPhoneLabel,passwordLabel,extraPasswordLabel,birthdayLabel,genderLabel]
        let textArray = ["ФИО","Телефон","Дополнительный телефон","Придумайте пароль","Повторите пароль","Дата рождения","Пол"]
        for item in 0 ... massive.count - 1{
            let helloLabel: UILabel = {
                let label = UILabel()
                //label.font = UIFont(name: "SF Pro Text", size: 17)
                label.font = UIFont.systemFont(ofSize: 12)
                label.text = textArray[item]
                label.textColor = .gray
                return label
            }()
            massive[item].addSubview(helloLabel)
            helloLabel.translatesAutoresizingMaskIntoConstraints = false
            helloLabel.topAnchor.constraint(equalTo: massive[item].topAnchor, constant: 10).isActive = true
            helloLabel.leadingAnchor.constraint(equalTo: massive[item].leadingAnchor, constant: 10).isActive = true
            if item >= 0 && item <= 5{
                
            } else {
                let segmentedControl : UISegmentedControl = {
                    var segmented = UISegmentedControl(items: ["Женский","Мужской"])
                    segmented.translatesAutoresizingMaskIntoConstraints = false
                    segmented.backgroundColor = #colorLiteral(red: 0.9606898427, green: 0.9608504176, blue: 0.9606687427, alpha: 1)
                    segmented.addTarget(self, action: #selector(segmentAction(_:)), for: .valueChanged)
                    segmented.selectedSegmentIndex = 0
                    return segmented
                }()
                massive[item].addSubview(segmentedControl)
                
                segmentedControl.topAnchor.constraint(equalTo: helloLabel.bottomAnchor, constant: 5).isActive = true
                segmentedControl.leadingAnchor.constraint(equalTo: massive[item].leadingAnchor, constant: 10).isActive = true
                segmentedControl.trailingAnchor.constraint(equalTo: massive[item].trailingAnchor, constant: -10).isActive = true
                segmentedControl.bottomAnchor.constraint(equalTo: massive[item].bottomAnchor, constant: -10).isActive = true
            }
            
        }
        
        
    }
    func setConstraints(){
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            nextButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            
            verticalStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            verticalStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -190),
            
            nameField.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 27),
            nameField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: 10),
            nameField.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: -10),
            phoneField.topAnchor.constraint(equalTo: phoneLabel.topAnchor, constant: 27),
            phoneField.leadingAnchor.constraint(equalTo: phoneLabel.leadingAnchor, constant: 10),
            phoneField.trailingAnchor.constraint(equalTo: phoneLabel.trailingAnchor, constant: -10),
            extraPhoneField.topAnchor.constraint(equalTo: extraPhoneLabel.topAnchor, constant: 27),
            extraPhoneField.leadingAnchor.constraint(equalTo: extraPhoneLabel.leadingAnchor, constant: 10),
            extraPhoneField.trailingAnchor.constraint(equalTo: extraPhoneLabel.trailingAnchor, constant: -10),
            passwordField.topAnchor.constraint(equalTo: passwordLabel.topAnchor, constant: 27),
            passwordField.leadingAnchor.constraint(equalTo: passwordLabel.leadingAnchor, constant: 10),
            passwordField.trailingAnchor.constraint(equalTo: passwordLabel.trailingAnchor, constant: -10),
            extraPasswordField.topAnchor.constraint(equalTo: extraPasswordLabel.topAnchor, constant: 27),
            extraPasswordField.leadingAnchor.constraint(equalTo: extraPasswordLabel.leadingAnchor, constant: 10),
            extraPasswordField.trailingAnchor.constraint(equalTo: extraPasswordLabel.trailingAnchor, constant: -10),
            birthdayField.topAnchor.constraint(equalTo: birthdayLabel.topAnchor, constant: 27),
            birthdayField.leadingAnchor.constraint(equalTo: birthdayLabel.leadingAnchor, constant: 10),
            birthdayField.trailingAnchor.constraint(equalTo: birthdayLabel.trailingAnchor, constant: -10),
            
        ])
    }
}

extension RegistrationViewController{
    @objc func nextFunc(){
        //self.present(RegistrationViewController(), animated: true, completion: nil)
        network()
        self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    @objc func closeFunc(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func segmentAction(_ segmentedControl: UISegmentedControl) {
            switch (segmentedControl.selectedSegmentIndex) {
            case 0:
                gender = "male"
            case 1:
                gender = "female"
            default:
                break
            }
        }
}

extension RegistrationViewController {
    func network(){
        let url = "user_mobile/create_last"
        guard let name = nameField.text else { return }
        guard let phone = phoneField.text else { return }
        guard let extraPhone = extraPhoneField.text else { return }
        guard let password = passwordField.text else { return }
        guard let extraPassword = extraPasswordField.text else { return }
        guard let birthday = birthdayField.text else { return }
        

        let parameters: [String: String] = [
            "phone" : phone,
            //"second_phone": extraPhone,
            //"name": name,
            "password": password,
            //"birth_date": birthday,
            //"gender": self.gender,
            //"email": "empty@mail.ru",
        ]
        
        print(phone)
        print(password)
        AF.request(baseURL + url, method: .post, parameters: parameters).validate().responseJSON(){ (data) in
            print(data)
        }
        authorization = true
    }
}

struct Registration: Decodable{
    var response: String = ""
}
