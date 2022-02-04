//
//  ContraindicationViewController.swift
//  Epilier
//
//  Created by Ernest Migranov on 07.10.2021.
//

import Foundation
import UIKit
import Alamofire

class ContraindicationViewController: UIViewController{
    
    var massive = [String]()
    var massiveForSearch = [String]()
    var headers: HTTPHeaders = []
    var object = ContraindicationPullUpController()
    var massiveChoosen = [String]()
    var appeared: Bool = false
    
    //let massive = ["предрасположенность к формированию келоидных и гипертрофических рубцов","плохое заживление ран","гиперчувствительность кожи"]
    
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
        detailingNavigationBar()
        self.view.addSubview(titleLabel)
        self.view.addSubview(tableView)
        setupTableView()
        setConstraints()
        network()
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
    
    func detailingNavigationBar(){
        let saveItem = UIBarButtonItem()
        saveItem.title = "Сохранить"
        
        self.navigationItem.rightBarButtonItem = saveItem
        self.navigationItem.rightBarButtonItem?.tintColor = .black
    }
}

extension ContraindicationViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return massive.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")  as! MyTableViewCell
        cell.selectionStyle = .none
        cell.titleLabel.numberOfLines = 0
        cell.titleLabel.lineBreakMode = .byWordWrapping
        cell.titleLabel.text = massive[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? MyTableViewCell else {
                return
            }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? MyTableViewCell else {
                return
            }
        cell.choosed = !cell.choosed
        switch cell.choosed {
        case true:
            cell.icon.image = UIImage(named: "choosed")
            massiveChoosen.append(cell.titleLabel.text!)
            object.contraindicationArray.append(cell.titleLabel.text!)
            print(massiveChoosen)
            object.setViews()
            object.tableView.reloadData()
        case false:
            cell.icon.image = UIImage(named: "round")
            print(cell.titleLabel.text!)
            massiveChoosen.removeAll(where: { $0 == cell.titleLabel.text! })
            object.contraindicationArray.removeAll(where: { $0 == cell.titleLabel.text! })
            object.setViews()
            
        }
        
        if massiveChoosen.count == 1{
            if appeared == false{
                addPullUpController(object, initialStickyPointOffset: CGFloat(100.0), animated: true)
                appeared = true
                self.tabBarController?.tabBar.isHidden = true
            }
        }
        if massiveChoosen.count == 0 {
            removePullUpController(object, animated: true)
            appeared = false
            self.tabBarController?.tabBar.isHidden = false
        }
    }
    
}

extension ContraindicationViewController{
    func network(){
        headers = [.authorization(bearerToken: token)]
        let url = "disallows/get"
        
        AF.request(baseURL + url, method: .get, headers: headers).validate().responseJSON{ responseJSON in
            switch responseJSON.result {
            case .success(let value):
                
                guard let jsonArray = value as? Array<[String: Any]> else { return }
                
                var disallows: [Disallow] = []
                
                for jsonObject in jsonArray {
                    guard
                        let name = jsonObject["name"] as? String
                    else {
                        return
                    }
                    let disallow = Disallow(name: name)
                    disallows.append(disallow)
                    self.massive.append(disallow.name)
                }
                //print(self.massive)
                self.tableView.reloadData()
                
            case .failure(let error):
                print(error)
            }
        }
    }
}


struct Disallow{
    var name: String = ""
}
