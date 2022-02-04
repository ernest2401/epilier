//
//  ThirdViewController.swift
//  Epilier
//
//  Created by Ernest Migranov on 01.10.2021.
//

import Foundation
import UIKit

class ThirdViewController: UIViewController {
    
    var height: CGFloat!
    private let transition = PanelTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navController = UINavigationController.init(rootViewController: SignUpPopUpView())
        navController.transitioningDelegate = transition
        navController.modalPresentationStyle = .custom
        
        
        height = view.frame.height * 0.50
        transition.height = height
        //self.present(child, animated: true)
        self.navigationController?.pushViewController(navController, animated: true)
        //self.present(navController ,animated: true, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
}
