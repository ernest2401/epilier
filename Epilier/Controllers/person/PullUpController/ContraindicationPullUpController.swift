//
//  ContraindicationPullUpController.swift
//  Epilier
//
//  Created by Ernest Migranov on 27.01.2022.
//

import Foundation
import UIKit
import PullUpController

class ContraindicationPullUpController: PullUpController {
    var expanded: Bool = false
    
    var object = PullUpController()
    var contraindicationArray = [String]()
    
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
        label.text = "Выбранные противопоказания"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    lazy var tableView = UITableView(frame: CGRect.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setNotExpandedView()
        setViews()
        tableView.reloadData()
    }
    
    override func pullUpControllerDidMove(to point: CGFloat) {
        expanded = !expanded
        
        if expanded == false {
            tableView.removeFromSuperview()
            expandedLabel.removeFromSuperview()
            setNotExpandedView()
            
            //label.text = self.contraindicationArray[0] + " и еще " + String(contraindicationArray.count)
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
        
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
    }
    
    func setExpandedView(){
        self.view.addSubview(expandedLabel)
        self.view.addSubview(tableView)
        
        tableView.register(MyTableViewCell.self,forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        expandedLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        expandedLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        expandedLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        tableView.topAnchor.constraint(equalTo: expandedLabel.bottomAnchor, constant: 15).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -350).isActive = true
    }
    
    func setViews(){
        if contraindicationArray.count > 0{
            let attrs1 = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.black]
            
            let attrs2 = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18), NSAttributedString.Key.foregroundColor : UIColor.gray]
            
            let attributedString1 = NSMutableAttributedString(string: self.contraindicationArray[0], attributes:attrs1)
            
            let attributedString2 = NSMutableAttributedString(string:" и еще " + String(self.contraindicationArray.count - 1), attributes:attrs2)
            
            if self.contraindicationArray.count > 1{
                attributedString1.append(attributedString2)
            }
            self.label.attributedText = attributedString1
        }
    }
    
    
}

extension ContraindicationPullUpController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contraindicationArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")  as! MyTableViewCell
        cell.titleLabel.text = contraindicationArray[indexPath.row]
        cell.icon.image = UIImage(named: "choosed")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
}
