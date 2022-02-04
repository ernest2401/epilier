//
//  ShopController.swift
//  Epilier
//
//  Created by Ernest Migranov on 12.10.2021.
//

import Foundation
import UIKit
import PullUpController

class ShopController: PullUpController {
    var expanded: Bool = false

    var object = PullUpController()
    var name : String = ""
    
    lazy var label : UILabel = {
        let label = UILabel()
        label.text = "Универсальная программа"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "choose"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var expandedLabel : UILabel = {
        let label = UILabel()
        label.text = "Выбранные услуги"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceLabel : UILabel = {
        let label = UILabel()
        label.text = "Стоимость: 1200 Р"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "nextButton"), for: .normal)
        button.addTarget(self, action: #selector(nextButtonFunc), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var massive = [String]()

    lazy var tableView = UITableView(frame: CGRect.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setNotExpandedView()
    }
    
    override func pullUpControllerDidMove(to point: CGFloat) {
        expanded = !expanded
        
        if expanded == false {
            tableView.removeFromSuperview()
            expandedLabel.removeFromSuperview()
            nextButton.removeFromSuperview()
            priceLabel.removeFromSuperview()
            setNotExpandedView()
        } else {
            print("Растянут")
            button.removeFromSuperview()
            label.removeFromSuperview()
            setExpandedView()
        }
    }
    
    func setView(){
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.shadowOpacity = 0.2
    }
    
    func setNotExpandedView(){
        view.addSubview(label)
        view.addSubview(button)
        
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        button.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
    }
    
    func setExpandedView(){
        self.view.addSubview(expandedLabel)
        self.view.addSubview(tableView)
        self.view.addSubview(priceLabel)
        self.view.addSubview(nextButton)
        
        tableView.register(TableViewCell.self,forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        expandedLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        expandedLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        tableView.topAnchor.constraint(equalTo: expandedLabel.bottomAnchor, constant: 15).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -350).isActive = true
        priceLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120).isActive = true
        priceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 20).isActive = true
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func nextButtonFunc(){
        let backItem = UIBarButtonItem()
        backItem.title = "Назад"
        self.navigationItem.backBarButtonItem = backItem
        self.navigationItem.backBarButtonItem?.tintColor = .black
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backItem
        self.navigationController?.pushViewController(BasketSignUpViewController(), animated: true)
        if self.navigationController == nil{
            self.present(BasketSignUpViewController(), animated: true, completion: nil)
        }
    }
}

extension ShopController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")  as! TableViewCell
        cell.titleLabel.text = "Универсальная программа"
        cell.icon.image = UIImage(named: "choosed")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
}

