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
    
    let exclamation = UIImageView(image: UIImage(named: "exclamation"))
    
    override func viewDidLoad() {
        self.title = "Записаться"
        view.backgroundColor = .white
        addViews()
        creatingButtons()
        detailingButtons()
        setConstraints()
        super.viewDidLoad()
    }
    
    func addViews(){
        self.view.addSubview(verticalStackView)
        self.dateButton.addSubview(exclamation)
        if self.navigationController == nil{
            self.view.addSubview(titleLabel)
        }
    }
    
    func detailingButtons(){
        let massive = [serviceButton,masterButton,dateButton,notificationButton]
        let massive2 = [serviceLabel,masterLabel,dateLabel,notificationLabel]
        for item in 0 ... massive.count - 1 {
            massive[item].addSubview(massive2[item])
            massive2[item].bottomAnchor.constraint(equalTo: massive[item].bottomAnchor, constant: -10).isActive = true
            massive2[item].leadingAnchor.constraint(equalTo: massive[item].leadingAnchor, constant: 10).isActive = true
        }
    }
    
    func creatingButtons(){
        let massive = [serviceButton,masterButton,dateButton,notificationButton]
        let textArray = ["Услуги","Косметолог (необязательно)","Дата и время","Напоминание"]
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
            massive[item].addSubview(helloLabel)
            massive[item].addSubview(icon)
            icon.translatesAutoresizingMaskIntoConstraints = false
            helloLabel.translatesAutoresizingMaskIntoConstraints = false
            helloLabel.topAnchor.constraint(equalTo: massive[item].topAnchor, constant: 5).isActive = true
            helloLabel.leadingAnchor.constraint(equalTo: massive[item].leadingAnchor, constant: 10).isActive = true
            icon.topAnchor.constraint(equalTo: massive[item].topAnchor, constant: 20).isActive = true
            icon.trailingAnchor.constraint(equalTo: massive[item].trailingAnchor, constant: -10).isActive = true
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
            verticalStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -490),
            exclamation.topAnchor.constraint(equalTo: dateButton.topAnchor, constant: 20),
            exclamation.trailingAnchor.constraint(equalTo: dateButton.trailingAnchor, constant: -30),
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
