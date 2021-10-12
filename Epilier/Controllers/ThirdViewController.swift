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
        let child = SignUpPopUpView()
        child.transitioningDelegate = transition
        child.modalPresentationStyle = .custom
        
        
        height = view.frame.height * 0.50
        transition.height = height
        self.present(child, animated: true)
    }
}
