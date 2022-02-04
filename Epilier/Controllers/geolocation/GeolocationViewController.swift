//
//  geolocationViewController.swift
//  Epilier
//
//  Created by Ernest Migranov on 18.10.2021.
//

import Foundation
import UIKit
import MapKit
import Alamofire

class GeolocationViewController: UIViewController {
    
    var massive = [String]()
    var massiveForSearch = [String]()
    var headers: HTTPHeaders = []
    
    var vc = MapViewController()
    
    lazy var titlel: UILabel = {
        var label = UILabel()
        label.text = "Выберите услуги"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(newController), for: .touchUpInside)
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor(hexString: "#C8EFF4")
        label.font = UIFont(name: "SF Pro Text", size: 17)
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.text = "Выберите город"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let geolocationPhoto = UIImageView(image: UIImage(named: "geolocationPhoto"))
    
    //    lazy var searchButton: UIButton = {
    //        let button = UIButton()
    //        button.layer.cornerRadius = 10
    //        button.translatesAutoresizingMaskIntoConstraints = false
    //        button.backgroundColor = #colorLiteral(red: 0.9685322642, green: 0.9686941504, blue: 0.9685109258, alpha: 1)
    //        button.layer.shadowColor = UIColor.black.cgColor
    //        button.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
    //        button.layer.shadowOpacity = 0.2
    //        button.layer.shadowRadius = 2
    //        return button
    //    }()
    
    let textField : UISearchBar = {
        let textField = UISearchBar()
        textField.tintColor = .gray
        textField.placeholder = "Поиск"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let searchImage = UIImageView(image: UIImage(named: "searchPhoto"))
    
    var table = UITableView()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        network()
        addSubViews()
        textField.delegate = self
        
        setupTableView()
        setConstraints()
        self.navigationItem.title = "Выберите город"
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func addSubViews(){
        //self.view.addSubview(button)
        //self.view.addSubview(titleLabel)
        self.view.addSubview(geolocationPhoto)
        //self.view.addSubview(searchButton)
        self.view.addSubview(textField)
        //self.searchButton.addSubview(searchImage)
        self.view.addSubview(table)
        self.view.addSubview(titleLabel)
    }
    
    func setConstraints(){
        geolocationPhoto.translatesAutoresizingMaskIntoConstraints = false
        searchImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            geolocationPhoto.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            geolocationPhoto.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            textField.topAnchor.constraint(equalTo: geolocationPhoto.bottomAnchor, constant: 5),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            table.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
        ])
    }
    
    @objc func newController(){
        let newVc = MapViewController()
        DispatchQueue.main.async {
            self.present(newVc, animated: true)
            
        }
    }
}

extension GeolocationViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return massive.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")  as! GeolocationTableViewCell
        cell.textLabel!.numberOfLines = 0
        cell.textLabel!.lineBreakMode = .byWordWrapping
        cell.titleLabel.text = massive[indexPath.row]
        cell.backgroundColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.vc.city = massive[indexPath.row]
        self.present(vc, animated: true, completion: nil)
    }
    
    private func setupTableView(){
        table.register(GeolocationTableViewCell.self,forCellReuseIdentifier: "cell")
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .white
        table.tableFooterView = UIView()
        table.translatesAutoresizingMaskIntoConstraints = false
        
    }
}

extension GeolocationViewController{
    func network(){
        headers = [.authorization(bearerToken: token)]
        let url = "city/get"
        
        AF.request(baseURL + url, method: .get, headers: headers).validate().responseJSON{ responseJSON in
            print("Вызывается")
            switch responseJSON.result {
            case .success(let value):
                
                guard let jsonArray = value as? Array<[String: Any]> else { return }
                
                var posts: [City] = []
                
                for jsonObject in jsonArray {
                    guard
                        let name = jsonObject["name"] as? String
                    else {
                        return
                    }
                    let post = City(name: name)
                    posts.append(post)
                    self.massive.append(post.name)
                    self.massiveForSearch.append(post.name)
                }
                
                self.table.reloadData()
                
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension GeolocationViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            massive = massiveForSearch
            self.table.reloadData()
        } else {
            print(searchText)
            func filterTableView(text:String) {
                massive = massiveForSearch.filter({ $0.hasPrefix(text) })
                self.table.reloadData()
            }
            filterTableView(text: searchText)
        }
    }
    
}

struct City{
    var name: String
}
