//
//  SertificateViewController.swift
//  Epilier
//
//  Created by Ernest Migranov on 07.10.2021.
//

import Foundation
import UIKit
import Alamofire

class CertificateViewController: UIViewController {
    
    var massive = [Int]()
    var url2 = "client_certificate_mobile/get"
    var headers: HTTPHeaders = []
    
    lazy var tableView = UITableView(frame: CGRect.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        network()
        setupTableView()
        addSubViews()
        setConstraints()
        
    }
    
    func addSubViews(){
        self.view.addSubview(tableView)
    }
    
    func creatingButtons(){
        for _ in 0...self.massive.count {
            
            let b = UIButton()
            b.translatesAutoresizingMaskIntoConstraints = false
            b.backgroundColor = .white
            b.layer.cornerRadius = 10
            b.backgroundColor = UIColor.white
            b.layer.shadowColor = UIColor.black.cgColor
            b.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            b.layer.shadowOpacity = 0.4
            b.layer.shadowRadius = 2
            b.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12).isActive = true
            b.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
            
            
            
            let nameLabel: UILabel = {
                let label = UILabel()
                //label.backgroundColor = UIColor(hexString: "#C8EFF4")
                label.font = UIFont(name: "SF Pro Text", size: 12)
                label.textColor = .gray
                label.text = "Доступно услуг: 12"
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()
            
        
        }
    }
    
    func setConstraints(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor,constant: 100.0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 8.0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -8.0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -8.0),
            
        ])
    }
}

extension CertificateViewController: UITableViewDelegate,UITableViewDataSource {
    
    private func setupTableView(){
        tableView.register(CertificateTableViewCell.self,forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return massive.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")  as! CertificateTableViewCell
        cell.selectionStyle = .none
        cell.textLabel!.numberOfLines = 0
        cell.textLabel!.lineBreakMode = .byWordWrapping
        cell.balanceLabel.text = "Доступно услуг: " + String(massive[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newVc = DetailCertificateViewController()
        DispatchQueue.main.async {
            let backItem = UIBarButtonItem()
            print("Пришло")
            backItem.title = "Назад"
            
            self.navigationItem.backBarButtonItem = backItem
            self.navigationItem.backBarButtonItem?.tintColor = .black
            self.navigationController?.pushViewController(newVc, animated: true)
        }
    }
}


extension CertificateViewController {
    func network(){
        headers = [.authorization(bearerToken: token)]
        let parameters: Parameters = ["client_id": 51]
        
        AF.request(baseURL + url2, method: .get,parameters: parameters).validate().responseJSON{ responseJSON in
            switch responseJSON.result {
            case .success(let value):
                guard let jsonArray = value as? Array<[String: Any]> else { return }
                var disallows: [Certificate] = []
                
                for jsonObject in jsonArray {
                    guard
                        let type_id = jsonObject["type_id"] as? Int
                    else {
                        return
                    }
                    
                    let certificate = Certificate(type_id: type_id)
                    self.massive.append(certificate.type_id)
                    print(certificate.type_id)
                    
                }
               
                print(self.massive)
                print("Получилось")
                self.tableView.reloadData()
            case .failure(let error):
                print("V")
                print(error)
            }
        }
            
    }
}

struct Certificate{
    var type_id: Int = 0
}
