//
//  SmsRefreshViewController.swift
//  Epilier
//
//  Created by Ernest Migranov on 22.10.2021.
//

import UIKit
import Alamofire

class SmsRefreshViewController: UIViewController {
    var count = 5
    var status: Bool = false
    
    var number : String = ""
    
    var object = SetPasswordViewController()
    
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
    
    lazy var smsLabel: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor(hexString: "#C8EFF4")
        label.font = UIFont(name: "SF Pro Text", size: 17)
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.text = "Введите код из СМС"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var confirmationLabelOne: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor(hexString: "#C8EFF4")
        label.font = UIFont(name: "SF Pro Text", size: 17)
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = "Подтвердите номер телефона"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var confirmationLabelTwo: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor(hexString: "#C8EFF4")
        label.font = UIFont(name: "SF Pro Text", size: 17)
        label.font = UIFont.systemFont(ofSize: 17)
        
        label.text = number + " введите код из СМС"
        label.attributedText = attributedText(withString: number + " введите код из СМС", boldString: number, font: label.font)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var changeNumberButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Изменить номер", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(changeNumberFunc), for: .touchUpInside)
        return button
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "------"
        textField.font = UIFont.systemFont(ofSize: 17)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var phoneButton : UIButton = {
        let item = UIButton()
        item.layer.cornerRadius = 10
        item.translatesAutoresizingMaskIntoConstraints = false
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
            label.text = "Код из СМС"
            label.textColor = .gray
            return label
        }()
        item.addSubview(helloLabel)
        item.addSubview(textField)
        helloLabel.translatesAutoresizingMaskIntoConstraints = false
        helloLabel.topAnchor.constraint(equalTo: item.topAnchor, constant: 10).isActive = true
        helloLabel.leadingAnchor.constraint(equalTo: item.leadingAnchor, constant: 10).isActive = true
        textField.topAnchor.constraint(equalTo: helloLabel.bottomAnchor, constant: 10).isActive = true
        textField.leadingAnchor.constraint(equalTo: item.leadingAnchor, constant: 10).isActive = true
        textField.trailingAnchor.constraint(equalTo: item.trailingAnchor, constant: -10).isActive = true
        return item
    }()
    
    lazy var timerLabel: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor(hexString: "#C8EFF4")
        label.font = UIFont(name: "SF Pro Text", size: 17)
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .gray
        label.text = "Отправить код повторно через 60 сек"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var againButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Отправить код повторно", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        //button.addTarget(self, action: #selector(changeNumberFunc), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        print("Открылся")
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubViews()
        setConstraints()
        var timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    func addSubViews(){
        self.view.addSubview(closeButton)
        self.view.addSubview(nextButton)
        self.view.addSubview(authPhoto)
        self.view.addSubview(smsLabel)
        self.view.addSubview(confirmationLabelOne)
        self.view.addSubview(confirmationLabelTwo)
        self.view.addSubview(phoneButton)
        self.view.addSubview(changeNumberButton)
        self.view.addSubview(timerLabel)
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
            
            smsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            smsLabel.topAnchor.constraint(equalTo: authPhoto.bottomAnchor, constant: 20),
            
            confirmationLabelOne.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirmationLabelOne.topAnchor.constraint(equalTo: smsLabel.bottomAnchor, constant: 20),
            confirmationLabelTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirmationLabelTwo.topAnchor.constraint(equalTo: confirmationLabelOne.bottomAnchor, constant: 5),
            changeNumberButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            changeNumberButton.topAnchor.constraint(equalTo: confirmationLabelTwo.bottomAnchor, constant: 5),
            
            
            phoneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            phoneButton.topAnchor.constraint(equalTo: changeNumberButton.bottomAnchor, constant: 20),
            phoneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            phoneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            phoneButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.095),
            
            timerLabel.topAnchor.constraint(equalTo: phoneButton.bottomAnchor, constant: 35),
            timerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])
    }
    
    @objc func nextFunc(){
        network()
    }
    
    
    @objc func closeFunc(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func changeNumberFunc(){
        
    }
}

extension SmsRefreshViewController{
    func attributedText(withString string: String, boldString: String, font: UIFont) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: string,
                                                         attributes: [NSAttributedString.Key.font: font])
        let boldFontAttribute: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: font.pointSize)]
        let range = (string as NSString).range(of: boldString)
        attributedString.addAttributes(boldFontAttribute, range: range)
        return attributedString
    }
}

extension SmsRefreshViewController {
    @objc func update() {
        if(count > 0){
            let seconds = String(count % 60)
            timerLabel.text = "Отправить код повторно через " + seconds + " сек"
            count -= 1
        } else {
            timerLabel.removeFromSuperview()
            setupAgainButton()
        }
        
    }
    
    func setupAgainButton(){
        view.addSubview(againButton)
        againButton.topAnchor.constraint(equalTo: phoneButton.bottomAnchor, constant: 35).isActive = true
        againButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    }
}


extension SmsRefreshViewController{
    func network(){
        let URL = "mobile/restore/confirm"

        guard let code = textField.text else { return }

        let parameters: Parameters = ["phone": number, "code": code]

        AF.request(baseURL + URL, method: .post,parameters: parameters).responseDecodable(of:ConfirmCode.self) { (data) in
            guard let response = data.value else { return }
            
            self.status = response.status
            print("Меняется")
        }
        toNextViewController()
    }
    
    func toNextViewController(){
        if status == true{
            object.number = number
            self.present(object, animated: true, completion: nil)
        } else {
            print("Код неверный")
        }
    }
}

struct ConfirmCode: Decodable{
    var status: Bool
}
