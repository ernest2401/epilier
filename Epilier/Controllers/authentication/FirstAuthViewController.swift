//
//  FirstAuthViewController.swift
//  Epilier
//
//  Created by Ernest Migranov on 22.10.2021.
//

import UIKit
import Alamofire

class FirstAuthViewController: UIViewController {
    
    var headers: HTTPHeaders = []
    var codeSMS = ""
    
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
        
        item.addSubview(helloLabel)
        helloLabel.translatesAutoresizingMaskIntoConstraints = false
        helloLabel.topAnchor.constraint(equalTo: item.topAnchor, constant: 10).isActive = true
        helloLabel.leadingAnchor.constraint(equalTo: item.leadingAnchor, constant: 10).isActive = true
        return item
    }()
    
    lazy var textField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Номер телефона"
        textField.font = UIFont.systemFont(ofSize: 19)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
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
        self.view.addSubview(textField)
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
            phoneButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.095),
            
            textField.topAnchor.constraint(equalTo: phoneButton.topAnchor, constant: 35),
            textField.leadingAnchor.constraint(equalTo: phoneButton.leadingAnchor, constant: 10),
            textField.trailingAnchor.constraint(equalTo: phoneButton.trailingAnchor, constant: -10),
        ])
    }
    
    @objc func nextFunc(){
        print("Нажимается")
        self.network()
    }
    
    
    @objc func closeFunc(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func authFunc(){
        let newVc = MainTabBarController()
        DispatchQueue.main.async {
            //self.navigationController?.navigationBar.isHidden = false
            let backItem = UIBarButtonItem()
            backItem.title = "Назад"
            self.navigationItem.backBarButtonItem = backItem
            self.navigationItem.backBarButtonItem?.tintColor = .black
            self.navigationItem.title = "Выберите услугу"
            self.navigationController?.navigationBar.topItem?.title = "Выберите услугу"
            self.navigationController?.pushViewController(newVc, animated: true)
        }
    }
    
}

extension FirstAuthViewController{
    func network(){
        //let url = "user_mobile/create_first"
        let url = "mobile/user/is_exist"
        guard let number = self.textField.text else {
            return
        }
        print(number)
        
        let parameters: [String: String] = [
            "phone" : number,
        ]
        
        AF.request(baseURL + url, method: .get, parameters: parameters).validate().responseDecodable(of:SmsCode.self) { (data) in
            //print(data.response)
            guard let code = data.value else { return }
            //self.codeSMS = String(code.response.suffix(5).dropLast())
            //print("1" + self.codeSMS)
            //print(code.response.suffix(5).dropLast())
            if code.status == true{
                self.toAuthenticate()
            } else {
                self.toNewViewController()
            }
        }
        
    }
    
    func toAuthenticate(){
        let newVc = AuthWithPasswordViewController()
        //let newVc = RefreshViewController()
        
        //newVc.codeSms = self.codeSMS
        //print(self.codeSMS)
        self.present(newVc, animated: true, completion: nil)
    }
    
    func toNewViewController(){
        let newVc = SmsAuthViewController()
        //let newVc = RefreshViewController()
        
        newVc.codeSms = self.codeSMS
        print(self.codeSMS)
        self.present(newVc, animated: true, completion: nil)
        
    }
}



struct SmsCode: Decodable{
    var response: String = ""
    var status: Bool
}
