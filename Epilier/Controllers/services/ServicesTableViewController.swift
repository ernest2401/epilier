//
//  ServicesTableViewController.swift
//  Epilier
//
//  Created by Ernest Migranov on 30.09.2021.
//

import UIKit
import PullUpController

class ServicesTableViewController: UIViewController {
    
    var appeared: Bool = false
    var object = ShopController()
    var table = UITableView(frame: CGRect.zero)
    
    var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "Выберите услуги"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var menuData = [
        Menu(subMenu: "Антицеллюлитная программа", menu: ["Ултразвуковая коррекция фигуры (бедра,ягодицы)","Ултразвуковая коррекция фигуры (живот,бока,спина)","Ултразвуковая коррекция фигуры (нижняя часть тела)","Ултразвуковая коррекция фигуры (руки)"], isStatus: false, images: ["image1","image2","image3","image4"], choosed: [false,false,false,false]),
        Menu(subMenu: "Микротоки", menu: ["Лифтинговая программа: лицо,шея,декольте","Лифтинговая программа для глаз","Лифтинговая программа для лица","Микротоки"], isStatus: false,images: ["image5","image6","image7","image8"], choosed: [false,false,false,false])
        
    ]
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        self.tabBarController?.tabBar.isHidden = true
        super.viewDidLoad()
        //setNavigationBar()
        addViews()
        setupTableView()
        setConstraints()
        self.navigationItem.title = "Выберите услугу"
    }
    
    func addViews(){
        self.view.addSubview(table)
        if self.navigationController == nil{
            self.view.addSubview(titleLabel)
        }
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
        if self.navigationController == nil{
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
                titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                table.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 0),
            ])
        } else {
            NSLayoutConstraint.activate([
                table.topAnchor.constraint(equalTo: view.topAnchor,constant: 0),
            ])
        }
        NSLayoutConstraint.activate([
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 10),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -50),
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
        cell.selectionStyle = .none
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
            return 75
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? TableViewCell else {
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
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? TableViewCell else {
            return
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
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        menuData[indexPath.section].choosed[indexPath.row] = !menuData[indexPath.section].choosed[indexPath.row]
        if menuData[indexPath.section].choosed[indexPath.row] == true {
            object.massive.append(menuData[indexPath.section].menu[indexPath.row])
            print(object.massive)
        } else {
            object.massive = object.massive.filter{$0 != menuData[indexPath.section].menu[indexPath.row]}
        }
        print(object.massive.count)
        if object.massive.count == 1{
            if appeared == false{
                addPullUpController(object, initialStickyPointOffset: CGFloat(100.0), animated: true)
                appeared = true
            }
        }
        if object.massive.count == 0 {
            removePullUpController(object, animated: true)
            appeared = false
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
}

