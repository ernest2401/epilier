//
//  SertificateViewController.swift
//  Epilier
//
//  Created by Ernest Migranov on 07.10.2021.
//

import Foundation
import UIKit

class SertificateViewController: UIViewController {
    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        
        return v
    }()
    
    let stackView : UIStackView = {
        let v = UIStackView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.axis = .vertical
        v.distribution = .fillEqually
        v.spacing = 10.0
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addSubViews()
        creatingButtons()
        setConstraints()
        
    }
    
    func addSubViews(){
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(stackView)
    }
    
    func creatingButtons(){
        for _ in 1...3 {
            
            let b = UIButton()
            b.translatesAutoresizingMaskIntoConstraints = false
            b.backgroundColor = .white
            b.layer.cornerRadius = 10
            b.backgroundColor = UIColor.white
            b.layer.shadowColor = UIColor.black.cgColor
            b.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            b.layer.shadowOpacity = 0.4
            b.layer.shadowRadius = 2
            stackView.addArrangedSubview(b)
            b.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12).isActive = true
            b.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
            
            
            
            
            let label: UILabel = {
                let label = UILabel()
                //label.backgroundColor = UIColor(hexString: "#C8EFF4")
                label.font = UIFont(name: "SF Pro Text", size: 17)
                label.font = UIFont.boldSystemFont(ofSize: 17)
                label.text = "Абонемент на 12 посещений"
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()
            
            let nameLabel: UILabel = {
                let label = UILabel()
                //label.backgroundColor = UIColor(hexString: "#C8EFF4")
                label.font = UIFont(name: "SF Pro Text", size: 12)
                label.textColor = .gray
                label.text = "Доступно услуг: 12"
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()
            
            let activityLabel: UILabel = {
                let label = UILabel()
                //label.backgroundColor = UIColor(hexString: "#C8EFF4")
                label.font = UIFont(name: "SF Pro Text", size: 14)
                label.textColor = #colorLiteral(red: 0.3246983886, green: 0.7665559649, blue: 0.106477119, alpha: 1)
                label.text = "Активирован "
                label.backgroundColor = #colorLiteral(red: 0.9661299586, green: 1, blue: 0.926908493, alpha: 1)
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()
            
            b.addSubview(activityLabel)
            b.addSubview(label)
            b.addSubview(nameLabel)
            activityLabel.topAnchor.constraint(equalTo: b.topAnchor, constant: 10).isActive = true
            activityLabel.leadingAnchor.constraint(equalTo: b.leadingAnchor, constant: 10).isActive = true
            label.leadingAnchor.constraint(equalTo: b.leadingAnchor, constant: 10).isActive = true
            label.topAnchor.constraint(equalTo: activityLabel.topAnchor, constant: 35).isActive = true
            nameLabel.leadingAnchor.constraint(equalTo: b.leadingAnchor, constant: 10).isActive = true
            nameLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
        }
    }
    func setConstraints(){
        NSLayoutConstraint.activate([
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8.0),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100.0),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8.0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8.0),
            
            stackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 0),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 8.0),
            stackView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -8.0),
        ])
    }
}
