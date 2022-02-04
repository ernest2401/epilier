//
//  ChoosingMasterViewController.swift
//  Epilier
//
//  Created by Ernest Migranov on 15.10.2021.
//
import Foundation
import UIKit

class ChoosingMasterViewController: UIViewController {
    
    var object = BasketSignUpViewController()
    
    var completion: ((String) -> ())?
    
    let photo = UIImageView(image: UIImage(named: "master1"))
    let star = UIImageView(image: UIImage(named: "Star"))
    let point = UIImageView(image: UIImage(named: "point"))
    let scale = UIImageView(image: UIImage(named: "scale"))
    
    let informationView : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 20
        label.backgroundColor = .white
        return label
    }()
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Велентей Виктория"
        label.backgroundColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    let markLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "4.7"
        label.backgroundColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    let amountLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "128 отзывов"
        label.backgroundColor = .white
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .gray
        return label
    }()
    
    lazy var labelInfo: UIView = {
        let label = UIView()
        label.backgroundColor = UIColor.white
        label.layer.cornerRadius = 10
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        label.layer.shadowOpacity = 0.2
        label.layer.shadowRadius = 2
        //label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let sessionLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ближайший сеанс"
        label.backgroundColor = .white
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    lazy var firstButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.9685322642, green: 0.9686941504, blue: 0.9685109258, alpha: 1)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        button.layer.shadowOpacity = 0.2
        button.layer.shadowRadius = 2
        button.setTitle("12:00", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    lazy var secondButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.9685322642, green: 0.9686941504, blue: 0.9685109258, alpha: 1)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        button.layer.shadowOpacity = 0.2
        button.layer.shadowRadius = 20
        button.setTitle("12:00", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    lazy var thirdButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.9685322642, green: 0.9686941504, blue: 0.9685109258, alpha: 1)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        button.layer.shadowOpacity = 0.2
        button.layer.shadowRadius = 20
        button.setTitle("12:00", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    lazy var horizontalStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            firstButton,
            secondButton,
            thirdButton
        ])
        sv.axis = .horizontal
        sv.spacing = 15
        sv.distribution = .fillEqually
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let reviewLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Оценки и отзывы"
        label.backgroundColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    let mainMark : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "4.5"
        label.backgroundColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .black
        return label
    }()
    
    let allReviews : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Оценок: 216"
        label.backgroundColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .gray
        return label
    }()
    
    let chooseButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.7661792636, green: 0.9183056355, blue: 0.9414497018, alpha: 1)
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.setImage(UIImage(named: "reviewsButton"), for: .normal)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        button.layer.shadowOpacity = 0.1
        button.layer.shadowRadius = 20
        button.setTitle("Выбрать", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: Selector(("chooseFunc")), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.7661792636, green: 0.9183056355, blue: 0.9414497018, alpha: 1)
        self.view.addSubview(photo)
        self.view.addSubview(informationView)
        self.informationView.addSubview(nameLabel)
        self.informationView.addSubview(star)
        self.informationView.addSubview(markLabel)
        self.informationView.addSubview(point)
        self.informationView.addSubview(amountLabel)
        self.informationView.addSubview(labelInfo)
        self.labelInfo.addSubview(sessionLabel)
        self.sessionLabel.addSubview(horizontalStackView)
        self.informationView.addSubview(reviewLabel)
        self.informationView.addSubview(mainMark)
        self.informationView.addSubview(allReviews)
        self.informationView.addSubview(scale)
        self.view.addSubview(chooseButton)
        setConstraints()
    }
    
    func setConstraints(){
        photo.translatesAutoresizingMaskIntoConstraints = false
        star.translatesAutoresizingMaskIntoConstraints = false
        point.translatesAutoresizingMaskIntoConstraints = false
        scale.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            photo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150),
            photo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -150),
            photo.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.20),
            informationView.topAnchor.constraint(equalTo: photo.bottomAnchor, constant: 0),
            informationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            informationView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            informationView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
//            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
//            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            nameLabel.centerXAnchor.constraint(equalTo: informationView.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: informationView.topAnchor, constant:30),
            star.topAnchor.constraint(equalTo: nameLabel.topAnchor,constant: 45),
            star.leadingAnchor.constraint(equalTo: informationView.leadingAnchor, constant:125),
            markLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor,constant: 40),
            markLabel.leadingAnchor.constraint(equalTo: star.trailingAnchor, constant:10),
            point.topAnchor.constraint(equalTo: nameLabel.topAnchor,constant: 50),
            point.leadingAnchor.constraint(equalTo: markLabel.trailingAnchor, constant:15),
            amountLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor,constant: 40),
            amountLabel.leadingAnchor.constraint(equalTo: point.trailingAnchor, constant:15),
            labelInfo.topAnchor.constraint(equalTo: amountLabel.bottomAnchor,constant: 20),
            labelInfo.leadingAnchor.constraint(equalTo: informationView.leadingAnchor, constant:15),
            labelInfo.trailingAnchor.constraint(equalTo: informationView.trailingAnchor, constant:-15),
            labelInfo.heightAnchor.constraint(equalTo: informationView.heightAnchor, multiplier: 0.18),
            sessionLabel.topAnchor.constraint(equalTo: labelInfo.topAnchor,constant: 10),
            sessionLabel.leadingAnchor.constraint(equalTo: labelInfo.leadingAnchor, constant:15),
            horizontalStackView.topAnchor.constraint(equalTo: sessionLabel.bottomAnchor,constant: 5),
            horizontalStackView.leadingAnchor.constraint(equalTo: labelInfo.leadingAnchor, constant:15),
            horizontalStackView.trailingAnchor.constraint(equalTo: labelInfo.trailingAnchor, constant:-160),
            horizontalStackView.bottomAnchor.constraint(equalTo: labelInfo.bottomAnchor,constant: -10),
            reviewLabel.topAnchor.constraint(equalTo: labelInfo.bottomAnchor,constant: 15),
            reviewLabel.leadingAnchor.constraint(equalTo: labelInfo.leadingAnchor, constant:15),
            mainMark.topAnchor.constraint(equalTo: reviewLabel.bottomAnchor,constant: 20),
            mainMark.leadingAnchor.constraint(equalTo: informationView.leadingAnchor, constant:50),
            allReviews.topAnchor.constraint(equalTo: mainMark.bottomAnchor,constant: 10),
            allReviews.leadingAnchor.constraint(equalTo: informationView.leadingAnchor, constant:30),
            scale.topAnchor.constraint(equalTo: reviewLabel.bottomAnchor,constant: 15),
            scale.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:140),
            scale.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:-10),
            scale.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:-270),
            chooseButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            chooseButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            chooseButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            chooseButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05)
            
        ])
    }
    
    @objc func chooseFunc(){
        print("Пошло")
        //object.refreshing()
        completion?("Ziga")
        self.dismiss(animated: true)
    }
}
