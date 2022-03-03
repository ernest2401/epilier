//
//  AuthViewController.swift
//  Epilier
//
//  Created by Ernest Migranov on 22.10.2021.
//

import UIKit
import Alamofire

class AuthWithPasswordViewController: UIViewController {
    
    
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
        button.addTarget(self, action: #selector(authFunc), for: .touchUpInside)
        return button
    }()
    
    lazy var phoneField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Номер телефона"
        textField.font = UIFont.systemFont(ofSize: 19)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var passwordField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Пароль"
        textField.isSecureTextEntry = true
        textField.font = UIFont.systemFont(ofSize: 19)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let authPhoto = UIImageView(image: UIImage(named: "authProfile"))
    
    lazy var personalLabel: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor(hexString: "#C8EFF4")
        label.font = UIFont(name: "SF Pro Text", size: 17)
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.text = "Личный кабинет"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var phoneLabel: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor(hexString: "#C8EFF4")
        label.font = UIFont(name: "SF Pro Text", size: 17)
        label.text = "Укажите ваш номер телефона"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var personalInfoButton = UIButton()
    lazy var contrInfoButton = UIButton()

    lazy var verticalStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            personalInfoButton,
            contrInfoButton,
        ])
        sv.axis = .vertical
        sv.spacing = 25
        sv.distribution = .fillEqually
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    lazy var passwordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Забыли пароль?", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(passwordFunc), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubViews()
        navigationController?.navigationBar.isHidden = true
        creatingButtons()
        detailingButtons()
        setConstraints()
    }
    
    func addSubViews(){
        self.view.addSubview(closeButton)
        self.view.addSubview(nextButton)
        self.view.addSubview(authPhoto)
        self.view.addSubview(personalLabel)
        self.view.addSubview(phoneLabel)
        self.view.addSubview(verticalStackView)
        self.view.addSubview(passwordButton)
    }
    
    func setConstraints(){
        authPhoto.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            nextButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            
            authPhoto.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            authPhoto.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            
            personalLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            personalLabel.topAnchor.constraint(equalTo: authPhoto.bottomAnchor, constant: 20),
            
            phoneLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            phoneLabel.topAnchor.constraint(equalTo: personalLabel.bottomAnchor, constant: 15),
            
            verticalStackView.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 20),
            verticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verticalStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            passwordButton.topAnchor.constraint(equalTo: verticalStackView.bottomAnchor, constant: 25),
            passwordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func creatingButtons(){
        let massive = [personalInfoButton,contrInfoButton]
        for item in massive{
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
        let massive = [personalInfoButton,contrInfoButton]
        let fields = [phoneField,passwordField]
        let textArray = ["Телефон","Пароль"]
        for item in 0 ... massive.count - 1{
            let helloLabel: UILabel = {
                let label = UILabel()
                //label.font = UIFont(name: "SF Pro Text", size: 17)
                label.font = UIFont.systemFont(ofSize: 14)
                label.text = textArray[item]
                label.textColor = .gray
                return label
            }()

            massive[item].addSubview(helloLabel)
            massive[item].addSubview(fields[item])
            helloLabel.translatesAutoresizingMaskIntoConstraints = false
            fields[item].translatesAutoresizingMaskIntoConstraints = false
            helloLabel.topAnchor.constraint(equalTo: massive[item].topAnchor, constant: 10).isActive = true
            helloLabel.leadingAnchor.constraint(equalTo: massive[item].leadingAnchor, constant: 10).isActive = true
            fields[item].topAnchor.constraint(equalTo: helloLabel.bottomAnchor, constant: 10).isActive = true
            fields[item].leadingAnchor.constraint(equalTo: massive[item].leadingAnchor, constant: 10).isActive = true
            fields[item].trailingAnchor.constraint(equalTo: massive[item].trailingAnchor, constant: -10).isActive = true
            //textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        }
    }
    
    @objc func closeFunc(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func authFunc(){
        network()
    }
    
    @objc func passwordFunc(){
        self.present(RefreshViewController(), animated: true, completion: nil)
    }

}

extension AuthWithPasswordViewController{
    func network(){
        let url = "auth"
        guard let number = self.phoneField.text else {
            return
        }
        guard let password = self.passwordField.text else {
            return
        }
        print(number)
        
        let parameters: [String: String] = [
            "phone" : number,
            "password": password,
        ]
        
        AF.request(baseURL + url, method: .post, parameters: parameters).validate().responseDecodable(of:SmsCode.self) { (data) in
            
            guard let code = data.value else { return }
            if code.status == true{
                
                self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
                authorization = true
            } else {
                self.phoneLabel.text = "Неверный логин или пароль"
            }
        }
        
    }
}
