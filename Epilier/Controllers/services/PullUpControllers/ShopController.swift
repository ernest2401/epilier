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
    
    weak var delegate: PullUpControllerDelegate?
    
    lazy var label : UILabel = {
        let label = UILabel()
        label.text = "Универсальная программа"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
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
    
    //var massive = [String]()

    lazy var tableView = UITableView(frame: CGRect.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setNotExpandedView()
        print("Вызвалось")
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
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60).isActive = true
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
    
    func setViews(){
        if massiveServices.count > 0{
            let attrs1 = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.black]
            
            let attrs2 = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18), NSAttributedString.Key.foregroundColor : UIColor.gray]
            
            let attributedString1 = NSMutableAttributedString(string: massiveServices[0], attributes:attrs1)
            
            let attributedString2 = NSMutableAttributedString(string:" и еще " + String(massiveServices.count - 1), attributes:attrs2)
            
            if massiveServices.count > 1{
                attributedString1.append(attributedString2)
            }
            self.label.attributedText = attributedString1
        }
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
        return massiveServices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")  as! TableViewCell
        cell.titleLabel.text = massiveServices[indexPath.row]
        cell.icon.image = UIImage(named: "choosed")
        cell.choosed = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? TableViewCell else {
                return
            }
        cell.choosed = !cell.choosed

        switch cell.choosed {
        case true:
            cell.icon.image = UIImage(named: "choosed")
            //massiveChoosen.append(cell.titleLabel.text!)
            tableView.reloadData()
            print(massiveServices)
            
        case false:
            cell.icon.image = UIImage(named: "round")
            print(cell.titleLabel.text!)
            massiveServices.removeAll(where: { $0 == cell.titleLabel.text! })
            print(massiveServices)
            tableView.reloadData()
            let data = cell.titleLabel.text
            update(data: data!)
            if massiveServices.count == 0{
                print("Дошло до нуля")
                removePullUpController(self, animated: true, completion: nil)
                expanded = false
                tableView.removeFromSuperview()
                expandedLabel.removeFromSuperview()
                priceLabel.removeFromSuperview()
                button.removeFromSuperview()
                nextButton.removeFromSuperview()
                setNotExpandedView()
                appearedFunc()
            }
        }
    }
}

extension ShopController: PullUpControllerDelegate{
    func update(data: String) {
        print(data)
        delegate?.update(data: data)
    }
    
    func appearedFunc() {
        delegate?.appearedFunc()
        
    }
}
