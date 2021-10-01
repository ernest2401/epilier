//
//  ServicesTableViewController.swift
//  Epilier
//
//  Created by Ernest Migranov on 30.09.2021.
//

import UIKit

class ServicesTableViewController: UIViewController {
    
    var table = UITableView(frame: CGRect.zero)
    
    var menuData = [
        Menu(subMenu: "Антицеллюлитная программа", menu: ["Ултразвуковая коррекция фигуры (бедра,ягодицы)","Ултразвуковая коррекция фигуры (живот,бока,спина)","Ултразвуковая коррекция фигуры (нижняя часть тела)","Ултразвуковая коррекция фигуры (руки)"], isStatus: false, images: ["image1","image2","image3","image4"]),
        Menu(subMenu: "Микротоки", menu: ["Лифтинговая программа: лицо,шея,декольте","Лифтинговая программа для глаз","Лифтинговая программа для лица","Микротоки"], isStatus: false,images: ["image5","image6","image7","image8"])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        self.view.addSubview(table)
        setupTableView()
        setConstraints()
    }
    
    func setNavigationBar(){
        self.navigationController?.navigationBar.isHidden = false
        self.title = "Выберите услуги"
    }
    
    private func setupTableView(){
        table.register(TableViewCell.self,forCellReuseIdentifier: "cell")
        table.delegate = self
        table.dataSource = self
        table.tableFooterView = UIView()
    }
    
    func setConstraints(){
        table.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.topAnchor,constant: 0),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0),
        ])
    }

}

extension ServicesTableViewController: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return menuData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuData[section].menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        //cell.textLabel?.text = menuData[indexPath.section].menu[indexPath.row]
        cell.titleLabel.text = menuData[indexPath.section].menu[indexPath.row]
        cell.image.image = UIImage(named: menuData[indexPath.section].images[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if menuData[indexPath.section].isStatus {
            return 65
        } else {
            return 0
        }
    }
}

extension ServicesTableViewController: ExpandableHeaderViewDelegate{
    func toggleSection(header: ExpandableHeaderView, section: Int) {
        menuData[section].isStatus = !menuData[section].isStatus
        table.beginUpdates()
        for i in 0..<menuData[section].menu.count{
            table.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        }
        table.endUpdates()
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ExpandableHeaderView()
        header.customInit(title: menuData[section].subMenu, section: section, delegate: self)
        return header
    }
}
