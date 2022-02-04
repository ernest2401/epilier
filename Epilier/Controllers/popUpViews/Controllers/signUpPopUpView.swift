//
//  signUpPopUpView.swift
//  Epilier
//
//  Created by Ernest Migranov on 01.10.2021.
//

import Foundation
import UIKit
import DJSemiModalViewController

class SignUpPopUpView: UIViewController{

    var height: CGFloat!
    private let transition = PanelTransition()
    
    lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "dismissButton"), for: .normal)
        button.addTarget(self, action: #selector(dismissSelf), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var signUpLabel: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor(hexString: "#C8EFF4")
        label.textColor = .black
        label.text = "Записаться"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var firstButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.white
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        button.layer.shadowOpacity = 0.2
        button.layer.shadowRadius = 2
        button.addTarget(self, action: #selector(firstButtonFunc), for: .touchUpInside)
        return button
    }()
    
    lazy var secondButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.white
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        button.layer.shadowOpacity = 0.2
        button.layer.shadowRadius = 20
        button.addTarget(self, action: #selector(secondButtonFunc), for: .touchUpInside)
        return button
    }()
    
    lazy var thirdButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.white
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        button.layer.shadowOpacity = 0.2
        button.layer.shadowRadius = 20
        button.addTarget(self, action: #selector(thirdButtonFunc), for: .touchUpInside)
        return button
    }()
    
    lazy var buttonsStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            firstButton,
            secondButton,
            thirdButton
        ])
        sv.axis = .vertical
        sv.spacing = 10
        sv.distribution = .fillEqually
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    lazy var firstLabelInfo: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor(hexString: "#C8EFF4")
        label.font = UIFont(name: "SF Pro Text", size: 17)
        label.text = "На услугу"
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var secondLabelInfo: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor(hexString: "#C8EFF4")
        label.font = UIFont(name: "SF Pro Text", size: 17)
        label.text = "К мастеру"
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var thirdLabelInfo: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor(hexString: "#C8EFF4")
        label.font = UIFont(name: "SF Pro Text", size: 17)
        label.text = "Повторно"
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var firstDescription: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor(hexString: "#C8EFF4")
        label.font = label.font.withSize(14)
        label.textColor = .gray
        label.text = "Выберите из множества услуг нашей студии"
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var secondDescription: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor(hexString: "#C8EFF4")
        label.font = label.font.withSize(14)
        label.textColor = .gray
        label.text = "Если вы знаете к какому именно мастеру хотите попасть"
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var thirdDescription: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor(hexString: "#C8EFF4")
        label.font = label.font.withSize(14)
        label.textColor = .gray
        label.text = "Повторите услугу, на которую записывались уже ранее"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }()
    
    let image1 = UIImageView(image: UIImage(named: "makeup1"))
    let image2 = UIImageView(image: UIImage(named: "chat1"))
    let image3 = UIImageView(image: UIImage(named: "repeat-once1"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        self.view.addSubview(dismissButton)
        self.view.addSubview(signUpLabel)
        self.view.addSubview(buttonsStackView)
        self.firstButton.addSubview(firstLabelInfo)
        self.secondButton.addSubview(secondLabelInfo)
        self.thirdButton.addSubview(thirdLabelInfo)
        self.firstButton.addSubview(firstDescription)
        self.secondButton.addSubview(secondDescription)
        self.thirdButton.addSubview(thirdDescription)
        self.firstButton.addSubview(image1)
        self.secondButton.addSubview(image2)
        self.thirdButton.addSubview(image3)
        setConstraints()
    }
    
    func setConstraints(){
        image1.translatesAutoresizingMaskIntoConstraints = false
        image2.translatesAutoresizingMaskIntoConstraints = false
        image3.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dismissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dismissButton.topAnchor.constraint(equalTo: view.topAnchor),
            dismissButton.widthAnchor.constraint(equalToConstant: 150),
            dismissButton.heightAnchor.constraint(equalToConstant: 30),
            signUpLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 35),
            signUpLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            buttonsStackView.topAnchor.constraint(equalTo: signUpLabel.bottomAnchor, constant: 15),
            buttonsStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            buttonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            image1.leadingAnchor.constraint(equalTo: firstButton.leadingAnchor, constant: 5),
            image1.topAnchor.constraint(equalTo: firstButton.topAnchor, constant: 10),
            image1.widthAnchor.constraint(equalTo: firstButton.widthAnchor, multiplier: 0.15),
            image2.widthAnchor.constraint(equalTo: firstButton.widthAnchor, multiplier: 0.15),
            image3.widthAnchor.constraint(equalTo: firstButton.widthAnchor, multiplier: 0.15),
            firstLabelInfo.leadingAnchor.constraint(equalTo: image1.trailingAnchor, constant: 10),
            firstLabelInfo.topAnchor.constraint(equalTo: firstButton.topAnchor, constant: 5),
            image2.leadingAnchor.constraint(equalTo: secondButton.leadingAnchor, constant: 5),
            image2.topAnchor.constraint(equalTo: secondButton.topAnchor, constant: 10),
            secondLabelInfo.leadingAnchor.constraint(equalTo: image2.trailingAnchor, constant: 10),
            secondLabelInfo.topAnchor.constraint(equalTo: secondButton.topAnchor, constant: 5),
            image3.leadingAnchor.constraint(equalTo: thirdButton.leadingAnchor, constant: 5),
            image3.topAnchor.constraint(equalTo: thirdButton.topAnchor, constant: 10),
            thirdLabelInfo.leadingAnchor.constraint(equalTo: image3.trailingAnchor, constant: 10),
            thirdLabelInfo.topAnchor.constraint(equalTo: thirdButton.topAnchor, constant: 5),
            firstDescription.leadingAnchor.constraint(equalTo: image1.trailingAnchor, constant: 10),
            firstDescription.topAnchor.constraint(equalTo: firstLabelInfo.bottomAnchor, constant: 0),
            firstDescription.trailingAnchor.constraint(equalTo: firstButton.trailingAnchor, constant: -10),
            secondDescription.leadingAnchor.constraint(equalTo: image2.trailingAnchor, constant: 10),
            secondDescription.topAnchor.constraint(equalTo: secondLabelInfo.bottomAnchor, constant: 0),
            secondDescription.trailingAnchor.constraint(equalTo: secondButton.trailingAnchor, constant: -10),
            thirdDescription.leadingAnchor.constraint(equalTo: image3.trailingAnchor, constant: 10),
            thirdDescription.trailingAnchor.constraint(equalTo: thirdButton.trailingAnchor, constant: -10),
            thirdDescription.topAnchor.constraint(equalTo: thirdLabelInfo.bottomAnchor, constant: 0),
        ])
        
        
    }
    
    @objc func firstButtonFunc(){
        var trueVC = ServicesTableViewController()
        DispatchQueue.main.async {
            if authorization == false {
                self.present(trueVC, animated: true, completion: nil)
            } else {
                self.navigationController?.navigationBar.isHidden = false
                let backItem = UIBarButtonItem()
                backItem.title = "Назад"
                self.navigationItem.backBarButtonItem = backItem
                self.navigationItem.backBarButtonItem?.tintColor = .black
                self.navigationItem.title = "Выберите услугу"
                self.navigationController?.navigationBar.topItem?.title = "Выберите услугу"
                self.navigationController?.pushViewController(trueVC, animated: true)
            }
        }
    }
    
    @objc func secondButtonFunc(){
        let newVc = MastersViewController()
        DispatchQueue.main.async {
            self.present(newVc, animated: true)
        }
    }
    
    @objc func thirdButtonFunc(){
        let child = againPopUpView()
        child.transitioningDelegate = transition
        child.modalPresentationStyle = .custom
        
        height = view.frame.height * 1.5
        transition.height = height
        self.present(child, animated: true)
    }
    
    @objc func dismissSelf() {
        self.dismiss(animated: true)
        //self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
}

extension UINavigationController {
    public func pushViewController(viewController: UIViewController,
                                   animated: Bool,
                                   completion: (() -> Void)?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        pushViewController(viewController, animated: animated)
        CATransaction.commit()
    }

    public func popViewController(animated: Bool,
                                  completion: (() -> Void)?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        popViewController(animated: animated)
        CATransaction.commit()
    }
}
