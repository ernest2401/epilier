//
//  MainViewController.swift
//  Epilier
//
//  Created by Ernest Migranov on 27.09.2021.
//

import Foundation
import UIKit
import DJSemiModalViewController

class FirstViewController: UIViewController{
    
    lazy var topLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor(hexString: "#C8EFF4")
        return label
    }()
    
    lazy var helloLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor(hexString: "#C8EFF4")
        label.font = UIFont(name: "SF Pro Text", size: 17)
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.text = "Привет, Екатерина👋"
        return label
    }()
    
    lazy var ringButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Ring"), for: .normal)
        return button
    }()
    
    let image1 = UIImageView(image: UIImage(named: "story1"))
    
    
    let scrollView: UIScrollView = {
        let v = UIScrollView()
//        let image1 = UIImageView(image: UIImage(named: "story1"))
//        let image2 = UIImageView(image: UIImage(named: "story2"))
//        let image3 = UIImageView(image: UIImage(named: "story3"))
        let button1 = UIButton()
        let button2 = UIButton()
        let button3 = UIButton()
        button1.setImage(UIImage(named: "story1"), for: .normal)
        button2.setImage(UIImage(named: "story2"), for: .normal)
        button3.setImage(UIImage(named: "story3"), for: .normal)
        v.addSubview(button1)
        v.addSubview(button2)
        v.addSubview(button3)
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        button3.translatesAutoresizingMaskIntoConstraints = false
        button1.addTarget(self, action: Selector("firstButtonFunc"), for: .touchUpInside)
        button2.addTarget(self, action: Selector("secondButtonFunc"), for: .touchUpInside)
        button3.addTarget(self, action: Selector("thirdButtonFunc"), for: .touchUpInside)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor(hexString: "#C8EFF4")
        button1.leftAnchor.constraint(equalTo: v.leftAnchor, constant: 0.0).isActive = true
        button1.topAnchor.constraint(equalTo: v.topAnchor, constant: 0.0).isActive = true
        button1.rightAnchor.constraint(equalTo: v.rightAnchor, constant: -300.0).isActive = true
        button1.bottomAnchor.constraint(equalTo: v.bottomAnchor, constant: 40).isActive = true
        button2.leftAnchor.constraint(equalTo: button1.rightAnchor, constant: -20.0).isActive = true
        button2.topAnchor.constraint(equalTo: v.topAnchor, constant: 0.0).isActive = true
        button2.bottomAnchor.constraint(equalTo: v.bottomAnchor, constant: 40).isActive = true
        button3.leftAnchor.constraint(equalTo: button2.rightAnchor, constant: -20.0).isActive = true
        button3.topAnchor.constraint(equalTo: v.topAnchor, constant: 0.0).isActive = true
        
        button3.bottomAnchor.constraint(equalTo: v.bottomAnchor, constant: 40).isActive = true
        
        return v
    }()
    
    lazy var geolocationButton: UIButton = {
        let button = UIButton()
        //button.frame.size = CGSize(width: 343, height: 56)
        button.backgroundColor = .white
        button.layer.shadowOpacity = 0.2
        button.layer.cornerRadius = 10
        //button.setTitle(, for: .normal)
        button.setTitle("Epilier на ул.Павлюхина, 25", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: Selector("recordFunc"), for: .touchUpInside)
        return button
    }()
    
    lazy var signUpLabel: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitle("Записаться", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var serviceButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "services"), for: .normal)
        //button.backgroundColor = .gray
        button.addTarget(self, action: Selector("serviceFunc"), for: .touchUpInside)
        return button
    }()
    
    lazy var masterButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "services"), for: .normal)
        button.addTarget(self, action: Selector(("mastersFunc")), for: .touchUpInside)
        return button
    }()
    
    private lazy var popupView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    lazy var againButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "services"), for: .normal)
        button.addTarget(self, action: Selector(("againFunc")), for: .touchUpInside)
        return button
    }()
    
    lazy var imageLocation: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "location")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var iconLocation: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "icon")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var horizontalStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            serviceButton,
            masterButton,
            againButton
        ])
        sv.axis = .horizontal
        sv.spacing = 10
        sv.distribution = .fillEqually
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    var height: CGFloat!
    private let transition = PanelTransition()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationController?.setNavigationBarHidden(true, animated: false)
        //hideNavigationBar(animated: false)
        adViews()
        setConstraints()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func setConstraints(){
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        helloLabel.translatesAutoresizingMaskIntoConstraints = false
        ringButton.translatesAutoresizingMaskIntoConstraints = false
        geolocationButton.translatesAutoresizingMaskIntoConstraints = false
        image1.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            topLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            topLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -620),
            helloLabel.topAnchor.constraint(equalTo: topLabel.topAnchor, constant: 56),
            helloLabel.leadingAnchor.constraint(equalTo: topLabel.leadingAnchor, constant: 16),
            helloLabel.trailingAnchor.constraint(equalTo: topLabel.trailingAnchor, constant: -52),
            ringButton.topAnchor.constraint(equalTo: topLabel.topAnchor, constant: 55),
            //ringButton.leadingAnchor.constraint(equalTo: helloLabel.leadingAnchor, constant: 40),
            ringButton.trailingAnchor.constraint(equalTo: topLabel.trailingAnchor, constant: -16),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8.0),
            scrollView.topAnchor.constraint(equalTo: helloLabel.topAnchor, constant: 30.0),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8.0),
            scrollView.bottomAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: -50),
            
            geolocationButton.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: -28),
            geolocationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            geolocationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            geolocationButton.bottomAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 28),
            signUpLabel.topAnchor.constraint(equalTo: geolocationButton.bottomAnchor, constant: 25),
            signUpLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            signUpLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            imageLocation.topAnchor.constraint(equalTo: geolocationButton.topAnchor, constant: 10),
            imageLocation.leadingAnchor.constraint(equalTo: geolocationButton.leadingAnchor, constant: 10),
            imageLocation.bottomAnchor.constraint(equalTo: geolocationButton.bottomAnchor, constant: -10),
            iconLocation.topAnchor.constraint(equalTo: geolocationButton.topAnchor, constant: 20),
            iconLocation.trailingAnchor.constraint(equalTo: geolocationButton.trailingAnchor, constant: -5),
            iconLocation.bottomAnchor.constraint(equalTo: geolocationButton.bottomAnchor, constant: -20),
            horizontalStackView.topAnchor.constraint(equalTo: signUpLabel.bottomAnchor, constant: 10),
            horizontalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            horizontalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            horizontalStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.13),
        ])
    }
}

extension FirstViewController{
    
    @objc func firstButtonFunc(){
        self.present(FirstArticleViewController(), animated: true)
    }
    @objc func secondButtonFunc(){
        self.present(FirstArticleViewController(), animated: true)
    }
    @objc func thirdButtonFunc(){
        self.present(FirstArticleViewController(), animated: true)
    }
    
    @objc func againFunc(){
        let child = againPopUpView()
        child.transitioningDelegate = transition
        child.modalPresentationStyle = .custom
        
        
        height = view.frame.height * 0.70
        transition.height = height
        self.present(child, animated: true)
    }
    
    
    @objc func recordFunc(){
        
        let child = studioPopUpView()
        child.transitioningDelegate = transition   // 2
        child.modalPresentationStyle = .custom  // 3
        height = view.frame.height * 0.60
        transition.height = height
        self.present(child, animated: true)
        
    }
    
    @objc func mastersFunc(){
        let newVc = ServicesTableViewController()
        DispatchQueue.main.async {
            let backItem = UIBarButtonItem()
            backItem.title = "Назад"
            self.navigationItem.backBarButtonItem = backItem
            self.navigationItem.backBarButtonItem?.tintColor = .black
            self.navigationItem.title = "Мастера"
            self.navigationController?.navigationBar.topItem?.title = "Мастера"
            self.navigationController?.pushViewController(newVc, animated: true)
        }
        // Поялвение popUpView
//        let controller = createSemiModalViewController()
//
//        controller.presentOn(presentingViewController: self, animated: true, onDismiss: {
//            self.tabBarController?.tabBar.isHidden = false
//            debugPrint("`DJSemiModalViewController` dismissed")
//        })
//        self.tabBarController?.tabBar.isHidden = true
//        debugPrint("`DJSemiModalViewController` presented")
  
    }
    
    @objc func serviceFunc(){
        let newVc = ServicesTableViewController()
        print("vasya")
        DispatchQueue.main.async {
            //self.navigationController?.navigationBar.isHidden = false
            let backItem = UIBarButtonItem()
            backItem.title = "Назад"
            self.navigationItem.backBarButtonItem = backItem
            self.navigationItem.backBarButtonItem?.tintColor = .black
            self.navigationItem.title = "Выберите услугу"
            self.navigationController?.navigationBar.topItem?.title = "Выберите услугу"
            self.navigationController?.pushViewController(newVc, animated: true)
            
             }
    }
    
    func adViews(){
        self.view.addSubview(topLabel)
        self.view.addSubview(geolocationButton)
        self.view.addSubview(signUpLabel)
        self.view.addSubview(serviceButton)
        self.view.addSubview(masterButton)
        self.view.addSubview(againButton)
        self.topLabel.addSubview(helloLabel)
        self.topLabel.addSubview(ringButton)
        self.view.addSubview(scrollView)
        self.view.addSubview(horizontalStackView)
        self.geolocationButton.addSubview(imageLocation)
        self.geolocationButton.addSubview(iconLocation)
        self.view.addSubview(popupView)
    }
    
    private func createSemiModalViewController() -> DJSemiModalViewController {

        let controller = DJSemiModalViewController()

        controller.maxWidth = view.frame.width
        controller.minHeight = 550

        controller.title = "Title"
        //controller.titleLabel.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.bold)
        controller.closeButton.setTitle("Done", for: .normal)
        controller.widthButton.setTitle("Напечатать", for: .normal)

        let label = UILabel()
        label.text = "An example label"
        label.textAlignment = .center
        controller.addArrangedSubview(view: label)

        let imageView = UIImageView(image: UIImage(named: "image1"))
        imageView.contentMode = .scaleAspectFit
        controller.addArrangedSubview(view: imageView, height: 200)

        let secondLabel = UILabel()
        secondLabel.textAlignment = .center
        secondLabel.text = "Pen and Pineapple"
        controller.addArrangedSubview(view: secondLabel)

        return controller
    }
}
