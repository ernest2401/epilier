//
//  NotificationViewController.swift
//  Epilier
//
//  Created by Ernest Migranov on 03.02.2022.
//

import UIKit

class NotificationViewController: UIViewController {
    
    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = "Уведомления"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Сегодня"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "closeButton"), for: .normal)
        button.addTarget(self, action: #selector(closeFunc), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let notificationButton: UIButton = {
        let b = UIButton()
        b.backgroundColor = .white
        b.layer.cornerRadius = 10
        b.backgroundColor = UIColor.white
        b.layer.shadowColor = UIColor.black.cgColor
        b.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        b.layer.shadowOpacity = 0.3
        //b.layer.shadowRadius =
        //button.addTarget(self, action: #selector(closeFunc), for: .touchUpInside)
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "12:22"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Вы записались на Чистку лица в студию Epilier Казань на 12 Сентября, 18:00 "
        label.numberOfLines = 2
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let image = UIImageView(image: UIImage(named: "notificationImage"))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubViews()
        setConstraints()
    }
    
    func addSubViews(){
        self.view.addSubview(label)
        self.view.addSubview(button)
        self.view.addSubview(titleLabel)
        self.view.addSubview(notificationButton)
        self.notificationButton.addSubview(timeLabel)
        self.notificationButton.addSubview(descriptionLabel)
        self.notificationButton.addSubview(image)
    }

    func setConstraints(){
        image.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            button.topAnchor.constraint(equalTo: view.topAnchor,constant: 25),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            titleLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            notificationButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            notificationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            notificationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            notificationButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12),
            timeLabel.topAnchor.constraint(equalTo: notificationButton.topAnchor, constant: 15),
            timeLabel.leadingAnchor.constraint(equalTo: notificationButton.leadingAnchor, constant: 10),
            descriptionLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: notificationButton.leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: notificationButton.trailingAnchor, constant: 5),
            image.trailingAnchor.constraint(equalTo: notificationButton.trailingAnchor, constant: -10),
            image.topAnchor.constraint(equalTo: notificationButton.topAnchor, constant: 10),
        ])
    }
}

extension NotificationViewController{
    @objc func closeFunc(){
        self.dismiss(animated: true, completion: nil)
    }
}
