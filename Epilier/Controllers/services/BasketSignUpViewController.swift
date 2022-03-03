//
//  basketSignUpViewController.swift
//  Epilier
//
//  Created by Ernest Migranov on 13.10.2021.
//

import Foundation
import UIKit

class BasketSignUpViewController: UIViewController{
    
    var object = SignUpPopUpController()
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "Выберите услуги"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var serviceButton : UIButton = {
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
        return item
    }()
    lazy var masterButton : UIButton = {
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
        item.addTarget(self, action: Selector("masterFunc"), for: .touchUpInside)
        return item
    }()
    
    lazy var dateButton : UIButton = {
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
        return item
    }()
    
    lazy var notificationButton : UIButton = {
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
        return item
    }()
    
    lazy var verticalStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            serviceButton,
            masterButton,
            dateButton,
            notificationButton,
        ])
        sv.axis = .vertical
        sv.spacing = 20
        sv.distribution = .fillEqually
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let serviceLabel: UILabel = {
        let label = UILabel()
        //label.font = UIFont(name: "SF Pro Text", size: 17)
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Ултразвуковая"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let masterLabel: UILabel = {
        let label = UILabel()
        //label.font = UIFont(name: "SF Pro Text", size: 17)
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Выберите косметолога"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        //label.font = UIFont(name: "SF Pro Text", size: 17)
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Выберите дату и время"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let notificationLabel: UILabel = {
        let label = UILabel()
        //label.font = UIFont(name: "SF Pro Text", size: 17)
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "За час до сеанса"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let recordView: UIView = {
        let b = UIView()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = UIColor.white
        b.layer.shadowColor = UIColor.black.cgColor
        b.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        b.layer.shadowOpacity = 0.3
        b.layer.shadowRadius = 10
        b.layer.cornerRadius = 20
        b.backgroundColor = .white
        return b
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.text = "Стоимость: 1700 ₽"
        let normalText  = "Стоимость: "
        let attributedString = NSMutableAttributedString(string:normalText)
        let boldText = "1700 Р"
        var attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)]
        let normalString = NSMutableAttributedString(string:boldText,attributes:attrs)

        attributedString.append(normalString)
        label.attributedText = attributedString
       
        return label
    }()
    
    lazy var recordButton : UIButton = {
        let item = UIButton()
        item.layer.cornerRadius = 10
        item.translatesAutoresizingMaskIntoConstraints = false
        item.setImage(UIImage(named: "recordButton"), for: .normal)
//        item.backgroundColor = UIColor.white
//        item.layer.shadowColor = UIColor.black.cgColor
//        item.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
//        item.layer.shadowOpacity = 0.1
//        item.layer.shadowRadius = 10
//        item.contentMode = .scaleAspectFit
        return item
    }()
    
    let exclamation = UIImageView(image: UIImage(named: "exclamation"))
    
    override func viewDidLoad() {
        self.title = "Записаться"
        view.backgroundColor = .white
        addViews()
        creatingButtons()
        setConstraints()
        super.viewDidLoad()
    }
    
    func addViews(){
        self.view.addSubview(verticalStackView)
        self.dateButton.addSubview(exclamation)
        if self.navigationController == nil{
            self.view.addSubview(titleLabel)
        }
        self.view.addSubview(recordView)
        self.recordView.addSubview(priceLabel)
        self.view.addSubview(recordButton)
    }
    
    func creatingButtons(){
        let massive = [serviceButton,masterButton,dateButton,notificationButton]
        let massive2 = [serviceLabel,masterLabel,dateLabel,notificationLabel]
        let textArray = ["Услуги","Косметолог (необязательно)","Дата и время","Напоминание"]
        let imagesArray = ["makeup1","chat1","calendar1","notification1"]
        for item in 0 ... massive.count - 1{
            let helloLabel: UILabel = {
                let label = UILabel()
                //label.font = UIFont(name: "SF Pro Text", size: 17)
                label.font = UIFont.systemFont(ofSize: 12)
                label.text = textArray[item]
                label.textColor = .gray
                return label
            }()
            let icon = UIImageView(image: UIImage(named: "icon"))
            let image = UIImageView(image: UIImage(named: imagesArray[item]))
            massive[item].addSubview(helloLabel)
            massive[item].addSubview(icon)
            massive[item].addSubview(image)
            massive[item].addSubview(massive2[item])
            
            icon.translatesAutoresizingMaskIntoConstraints = false
            image.translatesAutoresizingMaskIntoConstraints = false
            helloLabel.translatesAutoresizingMaskIntoConstraints = false
            image.centerYAnchor.constraint(equalTo: massive[item].centerYAnchor).isActive = true
            image.heightAnchor.constraint(equalTo: massive[item].heightAnchor, multiplier: 0.6).isActive = true
            image.widthAnchor.constraint(equalTo: massive[item].widthAnchor, multiplier: 0.09).isActive = true
            image.leadingAnchor.constraint(equalTo: massive[item].leadingAnchor, constant: 10).isActive = true
            helloLabel.topAnchor.constraint(equalTo: massive[item].topAnchor, constant: 5).isActive = true
            helloLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10).isActive = true
            icon.centerYAnchor.constraint(equalTo: massive[item].centerYAnchor).isActive = true
            icon.trailingAnchor.constraint(equalTo: massive[item].trailingAnchor, constant: -10).isActive = true
            massive2[item].bottomAnchor.constraint(equalTo: massive[item].bottomAnchor, constant: -10).isActive = true
            massive2[item].leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10).isActive = true
        }
    }
    
    func setConstraints(){
        exclamation.translatesAutoresizingMaskIntoConstraints = false
        if self.navigationController == nil {
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
                titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                verticalStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            ])
        } else {
            NSLayoutConstraint.activate([
                verticalStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 115),
            ])
        }
        NSLayoutConstraint.activate([
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            verticalStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -450),
            exclamation.topAnchor.constraint(equalTo: dateButton.topAnchor, constant: 20),
            exclamation.trailingAnchor.constraint(equalTo: dateButton.trailingAnchor, constant: -30),
            recordView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            recordView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            recordView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            recordView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
            priceLabel.topAnchor.constraint(equalTo: recordView.topAnchor, constant: 20),
            priceLabel.centerXAnchor.constraint(equalTo: recordView.centerXAnchor),
            recordButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 20),
            recordButton.centerXAnchor.constraint(equalTo: recordView.centerXAnchor),
        ])
    }
    
    @objc func masterFunc(){
        //print("Пошло")
        let vc = ChoosingMasterViewController()
        self.present(vc, animated: true)
        vc.completion = {[weak self] text in
            guard let self = self else { return }
            self.masterLabel.text = text
        }
        addPullUpController(object, initialStickyPointOffset: CGFloat(100.0), animated: true)
    }
    
    @objc func refreshingTwo(){
        DispatchQueue.main.async {
            print("Вызвана")
            self.masterLabel.text = "Vasya"
        }
    }
}


extension String {
    func attributedStringWithColor(_ strings: [String], color: UIColor, characterSpacing: UInt? = nil) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        for string in strings {
            let range = (self as NSString).range(of: string)
            attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        }

        guard let characterSpacing = characterSpacing else {return attributedString}

        attributedString.addAttribute(NSAttributedString.Key.kern, value: characterSpacing, range: NSRange(location: 0, length: attributedString.length))

        return attributedString
    }
}
