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
    
    let balanceLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Баланс: 1293 рубля"
        label.backgroundColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        return label
    }()
    
    lazy var personalInfoButton = UIButton()
    lazy var contrInfoButton = UIButton()
    lazy var sertificateButton = UIButton()
    lazy var visitButton = UIButton()
    lazy var settingsButton = UIButton()
    

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
        setNavBar()
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
            let image = UIImageView(image: UIImage(named: "icon"))
            item.addSubview(image)
            image.translatesAutoresizingMaskIntoConstraints = false
            image.topAnchor.constraint(equalTo: item.topAnchor, constant: 20).isActive = true
            image.trailingAnchor.constraint(equalTo: item.trailingAnchor, constant: -20).isActive = true
        }
    }
    
    func detailingButtons(){
        let massive = [personalInfoButton,contrInfoButton,sertificateButton,visitButton,settingsButton]
        let textArray = ["Персональная информация","Противопоказания","Абонементы и сертификаты","Мои визиты","Настройки"]
        let funcArray = ["personFunc","contrFunc","sertificateFunc","visitFunc","settingsFunc"]
        for item in 0 ... massive.count - 1{
            let helloLabel: UILabel = {
                let label = UILabel()
                label.font = UIFont(name: "SF Pro Text", size: 17)
                label.font = UIFont.systemFont(ofSize: 17)
                label.text = textArray[item]
                return label
            }()
            massive[item].addTarget(self, action: Selector(funcArray[item]), for: .touchUpInside)
            massive[item].addSubview(helloLabel)
            helloLabel.translatesAutoresizingMaskIntoConstraints = false
            helloLabel.topAnchor.constraint(equalTo: massive[item].topAnchor, constant: 20).isActive = true
            helloLabel.leadingAnchor.constraint(equalTo: massive[item].leadingAnchor, constant: 60).isActive = true
        }
    }
    
    func addSubViews(){
        self.view.addSubview(profilePhoto)
        self.view.addSubview(nameLabel)
        self.view.addSubview(balanceLabel)
        self.view.addSubview(verticalStackView)
    }
    
    func setNavBar(){
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 40, width: view.frame.size.width, height: 100))
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
        let newVc = SertificateViewController()
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

