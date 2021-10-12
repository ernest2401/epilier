//
//  ContraindicationViewController.swift
//  Epilier
//
//  Created by Ernest Migranov on 07.10.2021.
//

import Foundation
import UIKit

class ContraindicationViewController: UIViewController{
    
    let massive = ["предрасположенность к формированию келоидных и гипертрофических рубцов","плохое заживление ран","гиперчувствительность кожи"]
    
    lazy var tableView = UITableView(frame: CGRect.zero)
    
    let titleLabel : UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor(hexString: "#C8EFF4")
        //label.font = UIFont(name: "SF Pro Text", size: 12)
        label.textColor = .black
        label.text = "Противопоказания"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.view.addSubview(titleLabel)
        self.view.addSubview(tableView)
        setupTableView()
        setConstraints()
    }
    private func setupTableView(){
        tableView.register(MyTableViewCell.self,forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
    
    func setConstraints(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -210),
            
        ])
    }
}

extension ContraindicationViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return massive.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")  as! MyTableViewCell
        cell.textLabel!.numberOfLines = 0
        cell.textLabel!.lineBreakMode = .byWordWrapping
        cell.textLabel?.text = massive[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? MyTableViewCell else {
                return
            }
        cell.choosed = !cell.choosed
        switch cell.choosed {
        case true:
            cell.icon.image = UIImage(named: "choosed")
        case false:
            cell.icon.image = UIImage(named: "round")
        }
        
    }
    
}

