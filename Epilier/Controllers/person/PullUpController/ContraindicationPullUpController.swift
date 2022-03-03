//
//  ContraindicationPullUpController.swift
//  Epilier
//
//  Created by Ernest Migranov on 27.01.2022.
//

import Foundation
import UIKit
import PullUpController

protocol PullUpControllerDelegate: class {
    func update(data: String)
    
    func appearedFunc()
}

class ContraindicationPullUpController: PullUpController {
    var expanded: Bool = false
    
    //var object = PullUpController()
    //var vc = ContraindicationViewController()
    var contraindicationArray = [String]()
    
    weak var delegate: PullUpControllerDelegate?
    
    lazy var label : UILabel = {
        let label = UILabel()
        label.text = "Универсальная программа"
        label.numberOfLines = 2
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
        //print(expanded)
        self.tabBarController?.tabBar.isHidden = true
        print(massiveContraindications)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func pullUpControllerDidMove(to point: CGFloat) {
        expanded = !expanded
        
        if expanded == false {
            print("Сжат")
            notExpandedViewFunc()
            
            //label.text = self.contraindicationArray[0] + " и еще " + String(contraindicationArray.count)
        } else {
            print("Растянут")
            expandedViewFunc()
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
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
    }
    
    func setViews(){
        if massiveContraindications.count > 0{
            let attrs1 = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.black]
            
            let attrs2 = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18), NSAttributedString.Key.foregroundColor : UIColor.gray]
            
            let attributedString1 = NSMutableAttributedString(string: massiveContraindications[0], attributes:attrs1)
            
            let attributedString2 = NSMutableAttributedString(string:" и еще " + String(massiveContraindications.count - 1), attributes:attrs2)
            
            if massiveContraindications.count > 1{
                attributedString1.append(attributedString2)
            }
            self.label.attributedText = attributedString1
        }
    }
    
    func notExpandedViewFunc(){
        tableView.removeFromSuperview()
        expandedLabel.removeFromSuperview()
        setNotExpandedView()
    }
    
    func expandedViewFunc(){
        button.removeFromSuperview()
        label.removeFromSuperview()
        setExpandedView()
    }
}

extension ContraindicationPullUpController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return massiveContraindications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")  as! MyTableViewCell
        cell.titleLabel.text = massiveContraindications[indexPath.row]
        cell.icon.image = UIImage(named: "choosed")
        cell.choosed = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? MyTableViewCell else {
                return
            }
        cell.choosed = !cell.choosed

        switch cell.choosed {
        case true:
            cell.icon.image = UIImage(named: "choosed")
            //massiveChoosen.append(cell.titleLabel.text!)
            tableView.reloadData()
            print(massiveContraindications)
            //vc.contraindicationArray.append(cell.titleLabel.text!)
            //print(massiveChoosen)
            //object.setViews()
            //vc.tableView.reloadData()
        case false:
            cell.icon.image = UIImage(named: "round")
            print(cell.titleLabel.text!)
            massiveContraindications.removeAll(where: { $0 == cell.titleLabel.text! })
            print(massiveContraindications)
            tableView.reloadData()
            var data = cell.titleLabel.text
            update(data: data!)
            //object.contraindicationArray.removeAll(where: { $0 == cell.titleLabel.text! })
            //object.setViews()
            if massiveContraindications.count == 0{
                print("Дошло до нуля")
                removePullUpController(self, animated: true, completion: nil)
                expanded = false
                tableView.removeFromSuperview()
                expandedLabel.removeFromSuperview()
                setNotExpandedView()
                self.tabBarController?.tabBar.isHidden = true
                appearedFunc()
            }
        }
    }
}

extension ContraindicationPullUpController: PullUpControllerDelegate{
    func update(data: String) {
        print(data)
        delegate?.update(data: data)
    }
    
    func appearedFunc() {
        delegate?.appearedFunc()
        
    }
}
