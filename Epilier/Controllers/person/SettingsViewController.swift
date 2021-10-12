//
//  SettingsViewController.swift
//  Epilier
//
//  Created by Ernest Migranov on 11.10.2021.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    
    let notificationSwitch: UISwitch = {
        let v = UISwitch()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let notificationLabel: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor(hexString: "#C8EFF4")
        label.font = UIFont(name: "SF Pro Text", size: 19)
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = "Уведомления"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let settingsLabel: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor(hexString: "#C8EFF4")
        label.font = UIFont(name: "SF Pro Text", size: 17)
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .gray
        label.text = "Настройки уведомлений"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let recordLabel: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor(hexString: "#C8EFF4")
        label.font = UIFont(name: "SF Pro Text", size: 19)
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = "О записи"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let recordSwitch: UISwitch = {
        let v = UISwitch()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let confirmationLabel: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor(hexString: "#C8EFF4")
        label.font = UIFont(name: "SF Pro Text", size: 19)
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = "О подтверждении записи"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let confirmationSwitch: UISwitch = {
        let v = UISwitch()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let visitLabel: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor(hexString: "#C8EFF4")
        label.font = UIFont(name: "SF Pro Text", size: 19)
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = "О визите за 24 часа"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let visitSwitch: UISwitch = {
        let v = UISwitch()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        detailingNavigationBar()
        addSubViews()
        setConstraints()
    }
    
    func addSubViews(){
        self.view.addSubview(notificationLabel)
        self.view.addSubview(notificationSwitch)
        self.view.addSubview(settingsLabel)
        self.view.addSubview(recordLabel)
        self.view.addSubview(recordSwitch)
        self.view.addSubview(confirmationLabel)
        self.view.addSubview(confirmationSwitch)
        self.view.addSubview(visitLabel)
        self.view.addSubview(visitSwitch)
    }
    
    func setConstraints(){
        
        NSLayoutConstraint.activate([
            notificationLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            notificationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            notificationSwitch.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            notificationSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            settingsLabel.topAnchor.constraint(equalTo: notificationLabel.bottomAnchor, constant: 35),
            settingsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            recordLabel.topAnchor.constraint(equalTo: settingsLabel.bottomAnchor, constant: 35),
            recordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            recordSwitch.topAnchor.constraint(equalTo: settingsLabel.bottomAnchor, constant: 35),
            recordSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            confirmationLabel.topAnchor.constraint(equalTo: recordLabel.bottomAnchor, constant: 35),
            confirmationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            confirmationSwitch.topAnchor.constraint(equalTo: recordLabel.bottomAnchor, constant: 35),
            confirmationSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            visitLabel.topAnchor.constraint(equalTo: confirmationLabel.bottomAnchor, constant: 35),
            visitLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            visitSwitch.topAnchor.constraint(equalTo: confirmationLabel.bottomAnchor, constant: 35),
            visitSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            
        ])
    }
    
    func detailingNavigationBar(){
        self.title = "Настройки"
        let saveItem = UIBarButtonItem()
        saveItem.title = "Сохранить"
        
        self.navigationItem.rightBarButtonItem = saveItem
        self.navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    
}
