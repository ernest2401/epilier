//
//  SmsAuthViewController.swift
//  Epilier
//
//  Created by Ernest Migranov on 22.10.2021.
//

import UIKit

class SmsAuthViewController: UIViewController {
    var count = 59
    var codeSms = ""
    
    
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
        
        label.text = "+7 937 521 48 19 введите код из СМС"
        label.attributedText = attributedText(withString: "+7 937 521 48 19 введите код из СМС", boldString: "+7 937 521 48 19", font: label.font)
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
            label.text = "Код из СМС"
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
        textField.placeholder = "----"
        textField.font = UIFont.systemFont(ofSize: 19)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
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
            
            textField.topAnchor.constraint(equalTo: phoneButton.topAnchor, constant: 35),
            textField.leadingAnchor.constraint(equalTo: phoneButton.leadingAnchor, constant: 10),
            textField.trailingAnchor.constraint(equalTo: phoneButton.trailingAnchor, constant: -10),
        ])
    }
    
    @objc func nextFunc(){
        print(codeSms)
        guard let number = textField.text else { return}
        print(number)
        if codeSms == number{
            self.present(RegistrationViewController(), animated: true, completion: nil)
        }
        else {
            print("Ошибос")
        }
    }
    
    
    @objc func closeFunc(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func changeNumberFunc(){
        
    }
}

extension SmsAuthViewController{
    func attributedText(withString string: String, boldString: String, font: UIFont) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: string,
                                                         attributes: [NSAttributedString.Key.font: font])
        let boldFontAttribute: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: font.pointSize)]
        let range = (string as NSString).range(of: boldString)
        attributedString.addAttributes(boldFontAttribute, range: range)
        return attributedString
    }
}

extension SmsAuthViewController {
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
