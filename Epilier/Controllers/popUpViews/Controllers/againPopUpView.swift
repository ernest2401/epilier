//
//  againPopUpView.swift
//  Epilier
//
//  Created by Ernest Migranov on 01.10.2021.
//

import Foundation
import UIKit

class againPopUpView: UIViewController {
    
    lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "dismissButton"), for: .normal)
        button.addTarget(self, action: #selector(dismissSelf), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var againLabel: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitle("Повторно", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let firstImage = UIImageView(image: UIImage(named: "masterPhoto"))
    let secondImage = UIImageView(image: UIImage(named: "masterPhoto"))
    
    lazy var firstButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.white
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        button.layer.shadowOpacity = 0.2
        button.layer.shadowRadius = 2
        return button
    }()
    
    lazy var secondButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.white
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        button.layer.shadowOpacity = 0.2
        button.layer.shadowRadius = 20
        return button
    }()
    
    lazy var firstLabelInfo: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor(hexString: "#C8EFF4")
        label.font = UIFont(name: "SF Pro Text", size: 17)
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.text = "Лифтинговая программа"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var secondLabelInfo: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor(hexString: "#C8EFF4")
        label.font = UIFont(name: "SF Pro Text", size: 17)
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.text = "Лифтинговая программа"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    lazy var firstLabelMaster: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor(hexString: "#C8EFF4")
        label.font = UIFont(name: "SF Pro Text", size: 12)
        label.textColor = .gray
        label.text = "Виктория"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var secondLabelMaster: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor(hexString: "#C8EFF4")
        label.font = UIFont(name: "SF Pro Text", size: 12)
        label.textColor = .gray
        label.text = "Виктория"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var buttonsStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            firstButton,
            secondButton,
        ])
        sv.axis = .vertical
        sv.spacing = 10
        sv.distribution = .fillEqually
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubViews()
        setConstraints()
        view.layer.cornerRadius = 24
    }
    
    func addSubViews(){
        self.view.addSubview(againLabel)
        self.view.addSubview(dismissButton)
        self.view.addSubview(buttonsStackView)
        self.firstButton.addSubview(firstImage)
        self.secondButton.addSubview(secondImage)
        self.firstButton.addSubview(firstLabelInfo)
        self.secondButton.addSubview(secondLabelInfo)
        self.firstButton.addSubview(firstLabelMaster)
        self.secondButton.addSubview(secondLabelMaster)
    }
    
    func setConstraints(){
        firstImage.translatesAutoresizingMaskIntoConstraints = false
        secondImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dismissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dismissButton.topAnchor.constraint(equalTo: view.topAnchor),
            dismissButton.widthAnchor.constraint(equalToConstant: 150),
            dismissButton.heightAnchor.constraint(equalToConstant: 30),
            againLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 30),
            againLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 15),
            buttonsStackView.topAnchor.constraint(equalTo: againLabel.topAnchor,constant: 40),
            buttonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 15),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -15),
            buttonsStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -30),
            firstImage.leadingAnchor.constraint(equalTo: firstButton.leadingAnchor, constant: 10),
            firstImage.topAnchor.constraint(equalTo: firstButton.topAnchor, constant: 15),
            secondImage.leadingAnchor.constraint(equalTo: secondButton.leadingAnchor, constant: 10),
            secondImage.topAnchor.constraint(equalTo: secondButton.topAnchor, constant: 15),
            firstLabelInfo.leadingAnchor.constraint(equalTo: firstImage.trailingAnchor, constant: 10),
            firstLabelInfo.topAnchor.constraint(equalTo: firstButton.topAnchor, constant: 15),
            secondLabelInfo.leadingAnchor.constraint(equalTo: secondImage.trailingAnchor, constant: 10),
            secondLabelInfo.topAnchor.constraint(equalTo: secondButton.topAnchor, constant: 15),
            firstLabelMaster.leadingAnchor.constraint(equalTo: firstImage.trailingAnchor, constant: 10),
            firstLabelMaster.topAnchor.constraint(equalTo: firstLabelInfo.bottomAnchor, constant: 10),
            secondLabelMaster.leadingAnchor.constraint(equalTo: secondImage.trailingAnchor, constant: 10),
            secondLabelMaster.topAnchor.constraint(equalTo: secondLabelInfo.bottomAnchor, constant: 10),
            
        ])
        
    }
    
    @objc func dismissSelf() {
        self.dismiss(animated: true)
    }
}
