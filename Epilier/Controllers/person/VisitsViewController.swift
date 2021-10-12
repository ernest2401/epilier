//
//  VisitsViewController.swift
//  Epilier
//
//  Created by Ernest Migranov on 07.10.2021.
//

import Foundation
import UIKit

class VisitsViewController: UIViewController {

    let buttonsView : UIView = {
        var view = UIView()
        view.layer.cornerRadius = 10
        return view
    }()

    let segmentedControl : UISegmentedControl = {
        var segmented = UISegmentedControl(items: ["Предстоящие","Прошедшие"])
        segmented.translatesAutoresizingMaskIntoConstraints = false
        segmented.backgroundColor = #colorLiteral(red: 0.9606898427, green: 0.9608504176, blue: 0.9606687427, alpha: 1)
        segmented.addTarget(self, action: #selector(segmentAction(_:)), for: .valueChanged)
        segmented.selectedSegmentIndex = 0
        return segmented
    }()

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
    
    let topView : UIView = {
        var label = UIView()
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.masksToBounds = false
        label.layer.shadowOffset = CGSize(width: -15, height: 10)
        label.layer.shadowRadius = 3
        label.layer.shadowOpacity = 0.1
        return label
    }()
    
    let firstImage = UIImageView(image: UIImage(named: "masterPhoto"))
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Мои визиты"
        self.view.backgroundColor = .white

        self.view.addSubview(topView)
        self.view.addSubview(segmentedControl)
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(stackView)
        creatingButtons()
        setConstraints()
    }


    @objc func segmentAction(_ segmentedControl: UISegmentedControl) {
            switch (segmentedControl.selectedSegmentIndex) {
            case 0:
                print("0")
            case 1:
                print("1")
            default:
                break
            }
        }
    
    func creatingButtons(){
        for i in 1...3 {
            
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
            b.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
            b.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
            
            
            let firstImage = UIImageView(image: UIImage(named: "masterPhoto"))
            
            let label: UILabel = {
                let label = UILabel()
                //label.backgroundColor = UIColor(hexString: "#C8EFF4")
                label.font = UIFont(name: "SF Pro Text", size: 17)
                label.font = UIFont.boldSystemFont(ofSize: 17)
                label.text = "Лифтинговая программа"
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()
            
            let nameLabel: UILabel = {
                let label = UILabel()
                //label.backgroundColor = UIColor(hexString: "#C8EFF4")
                label.font = UIFont(name: "SF Pro Text", size: 12)
                label.textColor = .gray
                label.text = "Виктория"
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()
            
            b.addSubview(firstImage)
            b.addSubview(label)
            b.addSubview(nameLabel)
            firstImage.translatesAutoresizingMaskIntoConstraints = false
            firstImage.leadingAnchor.constraint(equalTo: b.leadingAnchor, constant: 15).isActive = true
            firstImage.topAnchor.constraint(equalTo: b.topAnchor, constant: 20).isActive = true
            label.leadingAnchor.constraint(equalTo: firstImage.trailingAnchor, constant: 10).isActive = true
            label.topAnchor.constraint(equalTo: b.topAnchor, constant: 15).isActive = true
            nameLabel.leadingAnchor.constraint(equalTo: firstImage.trailingAnchor, constant: 10).isActive = true
            nameLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
        }
    }

    func setConstraints(){
        buttonsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor ,constant: 0),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor ,constant: 0),
            topView.heightAnchor.constraint(equalTo: view.heightAnchor ,multiplier: 0.055),
            
            segmentedControl.topAnchor.constraint(equalTo: topView.topAnchor, constant: 0),
            segmentedControl.leadingAnchor.constraint(equalTo: topView.leadingAnchor ,constant: 20),
            segmentedControl.trailingAnchor.constraint(equalTo: topView.trailingAnchor ,constant: -20),
            
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8.0),
            scrollView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 20.0),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8.0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8.0),
            
            stackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 0),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 8.0),
            stackView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -8.0),
        ])
    }
}

class Visits2ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // add ten buttons to the stack view
        
        
    }
}
