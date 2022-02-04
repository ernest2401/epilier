//
//  FifthViewController.swift
//  Epilier
//
//  Created by Ernest Migranov on 06.10.2021.
//

import Foundation
import UIKit

class FifthViewController: UIViewController {
    
    let profilePhoto = UIImageView(image: UIImage(named: "profilePhoto"))
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Екатерина Иванова"
        label.backgroundColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    lazy var lettersLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ЕИ"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 23)
        label.font = UIFont.systemFont(ofSize: 100)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.0001
        return label
    }()
    
    let balanceLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Баланс: 1293 рубля"
        label.backgroundColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        return label
    }()
    
    lazy var personalInfoButton : UIButton = {
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
        let pointerPhoto = UIImageView(image: UIImage(named: "icon"))
        
        item.addSubview(pointerPhoto)
        pointerPhoto.translatesAutoresizingMaskIntoConstraints = false
        pointerPhoto.topAnchor.constraint(equalTo: item.topAnchor, constant: 20).isActive = true
        pointerPhoto.trailingAnchor.constraint(equalTo: item.trailingAnchor, constant: -20).isActive = true
        return item
    }()
    lazy var contrInfoButton : UIButton = {
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
        let pointerPhoto = UIImageView(image: UIImage(named: "icon"))
        item.addSubview(pointerPhoto)
        pointerPhoto.translatesAutoresizingMaskIntoConstraints = false
        pointerPhoto.topAnchor.constraint(equalTo: item.topAnchor, constant: 20).isActive = true
        pointerPhoto.trailingAnchor.constraint(equalTo: item.trailingAnchor, constant: -20).isActive = true
        return item
    }()
    lazy var sertificateButton : UIButton = {
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
        let pointerPhoto = UIImageView(image: UIImage(named: "icon"))
        item.addSubview(pointerPhoto)
        pointerPhoto.translatesAutoresizingMaskIntoConstraints = false
        pointerPhoto.topAnchor.constraint(equalTo: item.topAnchor, constant: 20).isActive = true
        pointerPhoto.trailingAnchor.constraint(equalTo: item.trailingAnchor, constant: -20).isActive = true
        return item
    }()
    lazy var visitButton : UIButton = {
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
        let pointerPhoto = UIImageView(image: UIImage(named: "icon"))
        item.addSubview(pointerPhoto)
        pointerPhoto.translatesAutoresizingMaskIntoConstraints = false
        pointerPhoto.topAnchor.constraint(equalTo: item.topAnchor, constant: 20).isActive = true
        pointerPhoto.trailingAnchor.constraint(equalTo: item.trailingAnchor, constant: -20).isActive = true
        return item
    }()
    lazy var settingsButton : UIButton = {
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
        let pointerPhoto = UIImageView(image: UIImage(named: "icon"))
        item.addSubview(pointerPhoto)
        pointerPhoto.translatesAutoresizingMaskIntoConstraints = false
        pointerPhoto.topAnchor.constraint(equalTo: item.topAnchor, constant: 20).isActive = true
        pointerPhoto.trailingAnchor.constraint(equalTo: item.trailingAnchor, constant: -20).isActive = true
        return item
    }()
    
    
    lazy var verticalStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            personalInfoButton,
            contrInfoButton,
            sertificateButton,
            visitButton,
            settingsButton,
        ])
        sv.axis = .vertical
        sv.spacing = 25
        sv.distribution = .fillEqually
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        creatingButtons()
        detailingButtons()
        setContstraints()
        self.navigationItem.title = "Профиль"
        self.navigationItem.titleView?.backgroundColor = .green
        self.navigationItem.titleView?.tintColor = .green
        //setNavBar()
    }
    
    func creatingButtons(){
        let massive = [personalInfoButton,contrInfoButton,sertificateButton,visitButton,settingsButton]
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
            let pointerPhoto = UIImageView(image: UIImage(named: "icon"))
            item.addSubview(pointerPhoto)
            pointerPhoto.translatesAutoresizingMaskIntoConstraints = false
            pointerPhoto.topAnchor.constraint(equalTo: item.topAnchor, constant: 20).isActive = true
            pointerPhoto.trailingAnchor.constraint(equalTo: item.trailingAnchor, constant: -20).isActive = true
        }
    }
    
    func detailingButtons(){
        let massive = [personalInfoButton,contrInfoButton,sertificateButton,visitButton,settingsButton]
        let textArray = ["Персональная информация","Противопоказания","Абонементы и сертификаты","Мои визиты","Настройки"]
        let funcArray = ["personFunc","contrFunc","sertificateFunc","visitFunc","settingsFunc"]
        let photoArray = ["personalPhoto","contrInfoPhoto","sertificatePhoto","visitPhoto","settingsPhoto"]
        for item in 0 ... massive.count - 1{
            
            let helloLabel: UILabel = {
                let label = UILabel()
                label.font = UIFont.systemFont(ofSize: 17)
                label.text = textArray[item]
                label.textColor = .black
                return label
            }()
            
            let iconPhoto = UIImageView(image: UIImage(named: photoArray[item]))
            
            
            massive[item].addTarget(self, action: Selector(funcArray[item]), for: .touchUpInside)
            massive[item].addSubview(helloLabel)
            massive[item].addSubview(iconPhoto)
            
            helloLabel.translatesAutoresizingMaskIntoConstraints = false
            iconPhoto.translatesAutoresizingMaskIntoConstraints = false
            
            //helloLabel.topAnchor.constraint(equalTo: massive[item].topAnchor, constant: 20).isActive = true
            helloLabel.centerYAnchor.constraint(equalTo: massive[item].centerYAnchor).isActive = true
            helloLabel.leadingAnchor.constraint(equalTo: massive[item].leadingAnchor, constant: 60).isActive = true
            iconPhoto.centerYAnchor.constraint(equalTo: massive[item].centerYAnchor).isActive = true
            iconPhoto.leadingAnchor.constraint(equalTo: massive[item].leadingAnchor, constant: 10).isActive = true
        }
    }
    
    func addSubViews(){
        self.view.addSubview(profilePhoto)
        self.view.addSubview(nameLabel)
        self.view.addSubview(balanceLabel)
        self.view.addSubview(verticalStackView)
        self.profilePhoto.addSubview(lettersLabel)
    }
    
    func setNavBar(){
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 40, width: view.frame.size.width, height: 100))
//        navBar.backgroundColor = .white
        self.view.addSubview(navBar)
        
        let navItem = UINavigationItem(title: "Профиль")
        navBar.setItems([navItem], animated: false)
    }
    
    func setContstraints(){
        profilePhoto.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profilePhoto.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
            profilePhoto.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profilePhoto.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.26),
            profilePhoto.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12),
//            lettersLabel.topAnchor.constraint(equalTo: profilePhoto.topAnchor, constant: 25),
//            lettersLabel.bottomAnchor.constraint(equalTo: profilePhoto.bottomAnchor, constant: -25),
//            lettersLabel.leadingAnchor.constraint(equalTo: profilePhoto.leadingAnchor, constant: 15),
//            lettersLabel.trailingAnchor.constraint(equalTo: profilePhoto.trailingAnchor, constant: -15),
            lettersLabel.widthAnchor.constraint(equalTo: profilePhoto.widthAnchor,multiplier: 0.65),
            lettersLabel.heightAnchor.constraint(equalTo: profilePhoto.heightAnchor,multiplier: 0.65),
            lettersLabel.centerXAnchor.constraint(equalTo: profilePhoto.centerXAnchor),
            lettersLabel.bottomAnchor.constraint(equalTo: profilePhoto.bottomAnchor, constant: -20),
            
            nameLabel.topAnchor.constraint(equalTo: profilePhoto.bottomAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            balanceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
            balanceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verticalStackView.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 35),
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            verticalStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -170),
            
            
        ])
    }
    @objc func personFunc(){
        print("first")
        let newVc = PersonInformationViewController()
        DispatchQueue.main.async {
            let backItem = UIBarButtonItem()
            backItem.title = "Назад"
            self.navigationItem.backBarButtonItem = backItem
            self.navigationItem.backBarButtonItem?.tintColor = .black
            self.navigationController?.pushViewController(newVc, animated: true)
        }
        
    }
    @objc func contrFunc(){
        print("second")
        let newVc = ContraindicationViewController()
        DispatchQueue.main.async {
            let backItem = UIBarButtonItem()
            
            backItem.title = "Назад"
            
            self.navigationItem.backBarButtonItem = backItem
            self.navigationItem.backBarButtonItem?.tintColor = .black
            self.navigationController?.pushViewController(newVc, animated: true)
        }
    }
    @objc func sertificateFunc(){
        print("Сертификат")
        let newVc = CertificateViewController()
        DispatchQueue.main.async {
            let backItem = UIBarButtonItem()
            
            backItem.title = "Назад"
            
            self.navigationItem.backBarButtonItem = backItem
            self.navigationItem.backBarButtonItem?.tintColor = .black
            self.navigationController?.pushViewController(newVc, animated: true)
        }
    }
    @objc func visitFunc(){
        let newVc = VisitsViewController()
        DispatchQueue.main.async {
            let backItem = UIBarButtonItem()
            
            backItem.title = "Назад"
            
            self.navigationItem.backBarButtonItem = backItem
            self.navigationItem.backBarButtonItem?.tintColor = .black
            self.navigationController?.pushViewController(newVc, animated: true)
        }
    }
    @objc func settingsFunc(){
        let newVc = SettingsViewController()
        DispatchQueue.main.async {
            let backItem = UIBarButtonItem()
            
            backItem.title = "Назад"
            
            self.navigationItem.backBarButtonItem = backItem
            self.navigationItem.backBarButtonItem?.tintColor = .black
            self.navigationController?.pushViewController(newVc, animated: true)
        }
    }
}

