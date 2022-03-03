//
//  DetailCertificateViewController.swift
//  Epilier
//
//  Created by Ernest Migranov on 25.11.2021.
//

import Foundation
import UIKit

class DetailCertificateViewController: UIViewController {
    
    var massive = ["Ультразвуковая коррекция фигуры","Ультразвуковая коррекция фигуры"]
    
    var table = UITableView(frame: CGRect.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Абонемент на 12 посещений"
        addViews()
        setupTableView()
        setConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    
    func addViews(){
        self.view.addSubview(table)
    }
    
    func setupTableView(){
        table.register(DetailCertificateTableViewCell.self,forCellReuseIdentifier: "cell")
        table.delegate = self
        table.dataSource = self
        table.tableFooterView = UIView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            table.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            table.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}

extension DetailCertificateViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return massive.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! DetailCertificateTableViewCell
        cell.selectionStyle = .none
        cell.titleLabel.text = massive[indexPath.row]
        cell.image.image = UIImage(named: "certificateImage")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    
}

