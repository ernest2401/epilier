//
//  VisitsViewController.swift
//  Epilier
//
//  Created by Ernest Migranov on 07.10.2021.
//

import Foundation
import UIKit
import Alamofire

class VisitsViewController: UIViewController {
    
    var headers: HTTPHeaders = []
    
    var massiveVisits = [String]()
    var massiveDates = [String]()
    var massiveMasters = [String]()

    let buttonsView : UIView = {
        var view = UIView()
        view.layer.cornerRadius = 10
        return view
    }()

    let segmentedControl : UISegmentedControl = {
        var segmented = UISegmentedControl(items: ["Предстоящие","Прошедшие"])
        segmented.translatesAutoresizingMaskIntoConstraints = false
        segmented.backgroundColor = #colorLiteral(red: 0.9606898427, green: 0.9608504176, blue: 0.9606687427, alpha: 1)
        segmented.addTarget(self, action: #selector(segmentAction(_:)), for: .valueChanged)
        segmented.selectedSegmentIndex = 0
        return segmented
    }()

    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white

        return v
    }()
    
    let stackView : UIStackView = {
        let v = UIStackView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.axis = .vertical
        v.distribution = .fillEqually
        v.spacing = 10.0
        return v
    }()
    
    let topView : UIView = {
        var label = UIView()
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.masksToBounds = false
        label.layer.shadowOffset = CGSize(width: -15, height: 10)
        label.layer.shadowRadius = 3
        label.layer.shadowOpacity = 0.1
        return label
    }()
    
    let firstImage = UIImageView(image: UIImage(named: "masterPhoto"))
    
    let button: UIButton = {
       var button = UIButton()
        button.setImage(UIImage(named: "visitImage"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
       return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Мои визиты"
        self.view.backgroundColor = .white
        self.tabBarController?.tabBar.isHidden = true

        self.view.addSubview(topView)
        self.view.addSubview(segmentedControl)
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(stackView)
        self.view.addSubview(button)
        //creatingButtons()
        network()
        setConstraints()

    }

    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    @objc func segmentAction(_ segmentedControl: UISegmentedControl) {
            switch (segmentedControl.selectedSegmentIndex) {
            case 0:
                print("0")
            case 1:
                print("1")
            default:
                break
            }
        }
    
    func creatingButtons(){
        for i in 0 ... self.massiveVisits.count - 1 {
            
            let b = UIButton()
            b.translatesAutoresizingMaskIntoConstraints = false
            b.backgroundColor = .white
            b.layer.cornerRadius = 10
            b.backgroundColor = UIColor.white
            b.layer.shadowColor = UIColor.black.cgColor
            b.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            b.layer.shadowOpacity = 0.4
            b.layer.shadowRadius = 2
            stackView.addArrangedSubview(b)
            b.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.26).isActive = true
            b.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
            
            
            let firstImage = UIImageView(image: UIImage(named: "masterPhoto"))
            
            let label: UILabel = {
                let label = UILabel()
                //label.backgroundColor = UIColor(hexString: "#C8EFF4")
                label.font = UIFont(name: "SF Pro Text", size: 17)
                label.font = UIFont.boldSystemFont(ofSize: 17)
                label.text = self.massiveVisits[i]
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()
            
            let nameLabel: UILabel = {
                let label = UILabel()
                //label.backgroundColor = UIColor(hexString: "#C8EFF4")
                label.font = UIFont(name: "SF Pro Text", size: 12)
                label.textColor = .gray
                label.text = self.massiveMasters[i]
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()
            
            let stripView: UIView = {
                let view = UIView()
                view.backgroundColor = UIColor(hexString: "DCDCDC")
                view.translatesAutoresizingMaskIntoConstraints = false
                return view
            }()
            
            let dateLabel: UILabel = {
               let label = UILabel()
                label.text = "Дата и время"
                label.textColor = UIColor(hexString: "#AAABB8")
                label.translatesAutoresizingMaskIntoConstraints = false
               return label
            }()
            
            let date: UILabel = {
               let label = UILabel()
                label.text = self.massiveDates[i]
                label.textColor = .black
                label.translatesAutoresizingMaskIntoConstraints = false
               return label
            }()
            
            let adressLabel: UILabel = {
               let label = UILabel()
                label.text = "Адрес"
                label.textColor = UIColor(hexString: "#AAABB8")
                label.translatesAutoresizingMaskIntoConstraints = false
               return label
            }()
            
            let adress: UILabel = {
               let label = UILabel()
                label.text = "Epilier на ул.Павлюхина, 25"
                label.textColor = .black
                label.translatesAutoresizingMaskIntoConstraints = false
               return label
            }()
            
            b.addSubview(firstImage)
            b.addSubview(label)
            b.addSubview(nameLabel)
            b.addSubview(stripView)
            b.addSubview(dateLabel)
            b.addSubview(date)
            b.addSubview(adressLabel)
            b.addSubview(adress)
            firstImage.translatesAutoresizingMaskIntoConstraints = false
            firstImage.leadingAnchor.constraint(equalTo: b.leadingAnchor, constant: 15).isActive = true
            firstImage.topAnchor.constraint(equalTo: b.topAnchor, constant: 20).isActive = true
            label.leadingAnchor.constraint(equalTo: firstImage.trailingAnchor, constant: 10).isActive = true
            label.topAnchor.constraint(equalTo: b.topAnchor, constant: 15).isActive = true
            nameLabel.leadingAnchor.constraint(equalTo: firstImage.trailingAnchor, constant: 10).isActive = true
            nameLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
            stripView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
            stripView.heightAnchor.constraint(equalTo: b.heightAnchor, multiplier: 0.006).isActive = true
            stripView.leadingAnchor.constraint(equalTo: b.leadingAnchor, constant: 10).isActive = true
            stripView.trailingAnchor.constraint(equalTo: b.trailingAnchor, constant: -10).isActive = true
            dateLabel.topAnchor.constraint(equalTo: stripView.bottomAnchor, constant: 20).isActive = true
            dateLabel.leadingAnchor.constraint(equalTo: b.leadingAnchor, constant: 20).isActive = true
            date.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8).isActive = true
            date.leadingAnchor.constraint(equalTo: b.leadingAnchor, constant: 20).isActive = true
            adressLabel.topAnchor.constraint(equalTo: date.bottomAnchor, constant: 20).isActive = true
            adressLabel.leadingAnchor.constraint(equalTo: b.leadingAnchor, constant: 20).isActive = true
            adress.topAnchor.constraint(equalTo: adressLabel.bottomAnchor, constant: 8).isActive = true
            adress.leadingAnchor.constraint(equalTo: b.leadingAnchor, constant: 20).isActive = true
            
        }
    }

    func setConstraints(){
        buttonsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor ,constant: 0),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor ,constant: 0),
            topView.heightAnchor.constraint(equalTo: view.heightAnchor ,multiplier: 0.055),
            
            segmentedControl.topAnchor.constraint(equalTo: topView.topAnchor, constant: 0),
            segmentedControl.leadingAnchor.constraint(equalTo: topView.leadingAnchor ,constant: 20),
            segmentedControl.trailingAnchor.constraint(equalTo: topView.trailingAnchor ,constant: -20),
            
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8.0),
            scrollView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 20.0),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8.0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100.0),
            
            stackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 0),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 8.0),
            stackView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -100.0),
            
            button.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

extension VisitsViewController{
    func network(){
        headers = [.authorization(bearerToken: token_mobile)]
        let url = "mobile/visit/get"
        
        let request = AF.request(baseURL + url, method: .get, headers: headers)
        
        request.responseDecodable(of: [VisitDetail].self) { (response) in
            //print(response)
            guard let films = response.value else { return }
            //self.massiveVisits.append()
            print(films)
            
            
            for i in 0 ... films.count - 1{
                if films[i].services.count != 0{
                    //print(films[i].services[0].name)
                    self.massiveVisits.append(films[i].services[0].name)
                    //self.massiveVisits.append(films[i].services[0])
                }
                self.massiveDates.append(films[i].formated_date)
                //print(films[i].staff)
                self.massiveMasters.append(films[i].staff.name + " " + films[i].staff.last_name)
            }
            self.creatingButtons()
            
        }
        
        
    }
}

struct VisitDetail: Decodable{
    //var visit_dt: String
    var services = [Visit]()
    var formated_date: String
    var staff: Staff
}

struct Visit: Decodable{
    //var formated_date: String
    //var services = [Service]()
    var name: String
}

struct Service: Decodable{
    var name: String
}

struct Staff: Decodable{
    var name: String
    var last_name: String
}
