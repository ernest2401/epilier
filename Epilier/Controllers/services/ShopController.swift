//
//  ShopController.swift
//  Epilier
//
//  Created by Ernest Migranov on 12.10.2021.
//

import Foundation
import UIKit
import PullUpController

class ShopController: PullUpController {
    //var expanded: Bool = false

    var object = PullUpController()
    var name : String = ""
    
    let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var enum1 = Program(name: "Vasya", price: "1200", time: "45")
    var enum2 = Program(name: "Lesha", price: "1200", time: "45")
    
    var massive = [Program]()
    
    
    override func viewDidLoad() {
        massive.append(enum1)
        massive.append(enum2)
        button.setTitle(name, for: .normal)
        super.viewDidLoad()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.shadowOpacity = 0.2
        self.view.addSubview(button)
        setConstraints()
        switch Action.move {
        case .add:
            print("Vas1")
        case .remove:
            print("Vas2")
        case .move:
            print("Vas3")
        }
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            button.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}


