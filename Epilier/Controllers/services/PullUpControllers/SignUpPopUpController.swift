//
//  SignUpPopUpController.swift
//  Epilier
//
//  Created by Ernest Migranov on 15.10.2021.
//

import Foundation
import UIKit
import PullUpController

class SignUpPopUpController: PullUpController {
    override func viewDidLoad() {
        setView()
        super.viewDidLoad()
    }
    
    func setView(){
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.shadowOpacity = 0.2
    }
}
