//
//  RefreshViewController.swift
//  Epilier
//
//  Created by Ernest Migranov on 22.10.2021.
//

import UIKit
import Alamofire

class RefreshViewController: UIViewController {

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
    
    let authPhoto = UIImageView(image: UIImage(named: "authProfile"))
    
    lazy var personalLabel: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor(hexString: "#C8EFF4")
        label.font = UIFont(name: "SF Pro Text", size: 17)
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.text = "Восстановление пароля"
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
    
    lazy var phoneButton : UIButton = {
        let item = UIButton()
        item.layer.cornerRadius = 10
        item.translatesAutoresizingMaskIntoConstraints = false
        //button.setImage(UIImage(named: "reviewsButton"), for: .normal)
        item.backgroundColor = UIColor.white
        item.layer.shadowColor = UIColor.black.cgColor
        item.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        item.layer.shadowOpacity = 0.1
        item.layer.shadowRadius = 10
        item.contentMode = .scaleAspectFit
        let helloLabel: UILabel = {
            let label = UILabel()
            //label.font = UIFont(name: "SF Pro Text", size: 17)
            label.font = UIFont.systemFont(ofSize: 14)
            label.text = "Телефон"
            label.textColor = .gray
            return label
        }()
        let textField = UITextField()
        textField.attributedText = NSAttributedString(string: "Vasya")
        textField.font = UIFont.systemFont(ofSize: 17)
        self.view.addSubview(textField)
        item.addSubview(helloLabel)
        item.addSubview(textField)
        helloLabel.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        helloLabel.topAnchor.constraint(equalTo: item.topAnchor, constant: 10).isActive = true
        helloLabel.leadingAnchor.constraint(equalTo: item.leadingAnchor, constant: 10).isActive = true
        textField.topAnchor.constraint(equalTo: helloLabel.bottomAnchor, constant: 10).isActive = true
        textField.leadingAnchor.constraint(equalTo: item.leadingAnchor, constant: 10).isActive = true
        textField.trailingAnchor.constraint(equalTo: item.trailingAnchor, constant: -10).isActive = true
        return item
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubViews()
        navigationController?.navigationBar.isHidden = true
        setConstraints()
    }
    
    func addSubViews(){
        self.view.addSubview(closeButton)
        self.view.addSubview(nextButton)
        self.view.addSubview(authPhoto)
        self.view.addSubview(personalLabel)
        self.view.addSubview(phoneLabel)
        self.view.addSubview(phoneButton)
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
            
            phoneButton.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 20),
            phoneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            phoneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            phoneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            phoneButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.095)
        ])
    }
    
    @objc func nextFunc(){
        network()
        self.present(SmsRefreshViewController(), animated: true, completion: nil)
    }
    
    
    @objc func closeFunc(){
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

extension RefreshViewController {
    func network(){
        print(token)
        let URL = "restore/phone"
        let parameters: Parameters = ["phone": "89373045555", "token": token,]
        AF.request(baseURL + URL, method: .post,parameters: parameters).responseDecodable(of:RefreshCode.self) { (data) in
            guard let code = data.value else { return }
            print(code)
        }
    }
}

struct RefreshCode: Decodable{
    var response: String = ""
}
