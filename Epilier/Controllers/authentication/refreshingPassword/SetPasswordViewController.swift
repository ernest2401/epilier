//
//  SetPasswordViewController.swift
//  Epilier
//
//  Created by Ernest Migranov on 22.10.2021.
//

import UIKit
import Alamofire

class SetPasswordViewController: UIViewController {
    
    var status: Bool = false
    
    var number: String = ""
    
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
    
    lazy var passwordLabel = UIButton()
    lazy var againPasswordLabel = UIButton()
    
    lazy var verticalStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            passwordLabel,
            againPasswordLabel,
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
        self.view.addSubview(nextButton)
        self.view.addSubview(closeButton)
        self.view.addSubview(verticalStackView)
        setConstraints()
        creatingButtons()
        detailingButtons()
        
    }
    
    func creatingButtons(){
        let massive = [passwordLabel,againPasswordLabel]
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
    
    let passwordField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 17)
        return textField
    }()
    
    let confirmPasswordField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 17)
        return textField
    }()
    
    func detailingButtons(){
        let massive = [passwordLabel,againPasswordLabel]
        let massiveFields = [passwordField,confirmPasswordField]
        let textArray = ["Придумайте пароль","Повторите пароль"]
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
            
            massive[item].addSubview(massiveFields[item])
            
            
            massiveFields[item].topAnchor.constraint(equalTo: helloLabel.bottomAnchor, constant: 10).isActive = true
            massiveFields[item].leadingAnchor.constraint(equalTo: massive[item].leadingAnchor, constant: 10).isActive = true
            massiveFields[item].trailingAnchor.constraint(equalTo: massive[item].trailingAnchor, constant: -10).isActive = true
            
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
            verticalStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -450),
        ])
    }
    
    @objc func nextFunc(){
        network()
        if status == true{
            self.dismiss(animated: true, completion: nil)
        } else {
            print("Еще раз")
        }
    }
    
    
    @objc func closeFunc(){
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension SetPasswordViewController{
    func network(){
        let URL = "mobile/restore/password"

        guard let password = passwordField.text else { return }
        guard let confirmPassword = confirmPasswordField.text else { return }

        let parameters: Parameters = ["phone": number,"password": password, "confirm_password": confirmPassword]

        AF.request(baseURL + URL, method: .post,parameters: parameters).responseDecodable(of:ConfirmCode.self) { (data) in
            guard let response = data.value else { return }
            print(response.status)
            self.status = response.status
        }
    }
}
