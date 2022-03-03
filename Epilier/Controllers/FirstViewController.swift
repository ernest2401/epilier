//
//  MainViewController.swift
//  Epilier
//
//  Created by Ernest Migranov on 27.09.2021.
//

import Foundation
import UIKit
import DJSemiModalViewController
import Alamofire

class FirstViewController: UIViewController{
    
    var completion: (() -> ())?
    var object = global()
    
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
        button.addTarget(self, action: Selector("ringFunc"), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let image1 = UIImageView(image: UIImage(named: "story1"))
    
    
    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.showsHorizontalScrollIndicator = false
        v.showsVerticalScrollIndicator = false
        let button1 = UIButton()
        let button2 = UIButton()
        let button3 = UIButton()
        button1.setImage(UIImage(named: "story1"), for: .normal)
        button2.setImage(UIImage(named: "story2"), for: .normal)
        button3.setImage(UIImage(named: "story1"), for: .normal)
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
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.4
        button.layer.shadowRadius = 5
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
    
    let serviceImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "firstService"))
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let masterImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "firstMaster"))
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let againImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "firstAgain"))
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var serviceButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.white
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        button.layer.shadowOpacity = 0.2
        button.layer.shadowRadius = 2
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        button.addTarget(self, action: Selector("serviceFunc"), for: .touchUpInside)
        return button
    }()
    
    lazy var masterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        button.layer.shadowOpacity = 0.2
        button.layer.shadowRadius = 2
        button.addTarget(self, action: Selector(("mastersFunc")), for: .touchUpInside)
        return button
    }()
    
    lazy var againButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        button.layer.shadowOpacity = 0.2
        button.layer.shadowRadius = 2
        
        //button.setImage(UIImage(named: "firstAgain"), for: .normal)
        button.addTarget(self, action: Selector(("againFunc")), for: .touchUpInside)
        //button.addTarget(self, action: Selector(("toStudioFunc")), for: .touchUpInside)
        return button
    }()
    
    private lazy var popupView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
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
    
    let actual: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 21)
        label.text = "Актуальное"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let actualScrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.showsHorizontalScrollIndicator = false
        return v
    }()
    
    let actualStackView : UIStackView = {
        let v = UIStackView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.axis = .horizontal
        v.distribution = .fillEqually
        v.spacing = 10.0
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationController?.setNavigationBarHidden(true, animated: false)
        //hideNavigationBar(animated: false)
        view.backgroundColor = .white
        adViews()
        creatingActualButtons()
        setConstraints()
        setButtonImages()
        network()
        network_mobile()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func creatingActualButtons(){
        for i in 1...3 {
            
            let b = UIButton()
            b.translatesAutoresizingMaskIntoConstraints = false
            b.backgroundColor = .white
            //b.layer.cornerRadius = 10
            b.backgroundColor = .gray
            b.backgroundColor = UIColor.white
            //b.setImage(UIImage(named: "actualStack"), for: .normal)
            let image = UIImageView(image: UIImage(named: "actualStack"))
            image.layer.cornerRadius = 10
            image.clipsToBounds = true
            let titleLabel = UILabel()
            titleLabel.text = "Крепкий орешек"
            titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
            image.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            let descriptionLabel = UILabel()
            descriptionLabel.text = "Марфон к лету Комплекс"
            descriptionLabel.textColor = .gray
            descriptionLabel.font = UIFont.systemFont(ofSize: 16)
            descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
            actualStackView.addArrangedSubview(b)
            b.addSubview(image)
            b.addSubview(titleLabel)
            b.addSubview(descriptionLabel)
            b.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.27).isActive = true
            b.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
            b.addTarget(self, action: #selector(firstButtonFunc), for: .touchUpInside)
            image.topAnchor.constraint(equalTo: b.topAnchor, constant: 0).isActive = true
            image.leadingAnchor.constraint(equalTo: b.leadingAnchor, constant: 0).isActive = true
            image.trailingAnchor.constraint(equalTo: b.trailingAnchor, constant: 0).isActive = true
            image.heightAnchor.constraint(equalTo: b.heightAnchor, multiplier: 0.68).isActive = true
            titleLabel.topAnchor.constraint(equalTo: image.bottomAnchor,constant: 15).isActive = true
            titleLabel.leadingAnchor.constraint(equalTo: b.leadingAnchor,constant: 0).isActive = true
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 5).isActive = true
            descriptionLabel.leadingAnchor.constraint(equalTo: b.leadingAnchor,constant: 0).isActive = true
            
        }
        
    }
    
    func setButtonImages(){
        let massiveWithButtons = [serviceButton,masterButton,againButton]
        let massiveWithImages = [serviceImage,masterImage,againImage]
        for i in 0 ... 2{
            print(i)
            massiveWithButtons[i].addSubview(massiveWithImages[i])
            massiveWithImages[i].topAnchor.constraint(equalTo: massiveWithButtons[i].topAnchor, constant: 0).isActive = true
            massiveWithImages[i].leadingAnchor.constraint(equalTo: massiveWithButtons[i].leadingAnchor, constant: 0).isActive = true
            massiveWithImages[i].trailingAnchor.constraint(equalTo: massiveWithButtons[i].trailingAnchor, constant: 0).isActive = true
            massiveWithImages[i].bottomAnchor.constraint(equalTo: massiveWithButtons[i].bottomAnchor, constant: 0).isActive = true
        }
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
            //topLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -600),
            topLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            helloLabel.topAnchor.constraint(equalTo: topLabel.topAnchor, constant: 56),
            helloLabel.leadingAnchor.constraint(equalTo: topLabel.leadingAnchor, constant: 16),
            helloLabel.trailingAnchor.constraint(equalTo: topLabel.trailingAnchor, constant: -52),
            ringButton.topAnchor.constraint(equalTo: topLabel.topAnchor, constant: 55),
            //ringButton.leadingAnchor.constraint(equalTo: helloLabel.leadingAnchor, constant: 40),
            ringButton.trailingAnchor.constraint(equalTo: topLabel.trailingAnchor, constant: -16),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8.0),
            scrollView.topAnchor.constraint(equalTo: helloLabel.topAnchor, constant: 30.0),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8.0),
            scrollView.heightAnchor.constraint(equalTo: topLabel.heightAnchor, multiplier: 0.5),
            //scrollView.bottomAnchor.constraint(equalTo: topLabel.bottomAnchor, multiplier: -20),
            
            geolocationButton.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 20),
            geolocationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            geolocationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            geolocationButton.bottomAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 25),
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
            
            actual.topAnchor.constraint(equalTo: horizontalStackView.bottomAnchor, constant: 15),
            actual.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            actualScrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8.0),
            actualScrollView.topAnchor.constraint(equalTo: actual.bottomAnchor, constant: 10.0),
            actualScrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8.0),
            actualScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8.0),
            
            actualStackView.leftAnchor.constraint(equalTo: actualScrollView.leftAnchor, constant: 0),
            actualStackView.topAnchor.constraint(equalTo: actualScrollView.topAnchor, constant: 8.0),
            actualStackView.rightAnchor.constraint(equalTo: actualScrollView.rightAnchor, constant: 0),
            actualStackView.bottomAnchor.constraint(equalTo: actualScrollView.bottomAnchor, constant: -30.0),
            
            
            
        ])
    }
}

extension FirstViewController{
    
    func network(){
        let URL = "login"
        let parameters: Parameters = ["phone": "+7 (939) 392 98-87", "password": "123321",]
        AF.request(baseURL + URL, method: .post,parameters: parameters).responseDecodable(of:global.self) { (data) in
            guard let hero = data.value else { return }
            token = hero.token
            //print(token)
        }
    }
    
    func network_mobile(){
        let URL = "auth"
        let parameters: Parameters = ["phone": "+7 (939) 392 98-87", "password": "123321",]
        AF.request(baseURL + URL, method: .post,parameters: parameters).responseDecodable(of:global.self) { (data) in
            guard let hero = data.value else { return }
            token_mobile = hero.token
            print(token_mobile)
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
        self.view.addSubview(ringButton)
        self.view.addSubview(scrollView)
        self.view.addSubview(horizontalStackView)
        self.geolocationButton.addSubview(imageLocation)
        self.geolocationButton.addSubview(iconLocation)
        self.view.addSubview(actual)
        self.view.addSubview(popupView)
        self.view.addSubview(actualScrollView)
        self.actualScrollView.addSubview(actualStackView)
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


extension FirstViewController{
    
    @objc func ringFunc(){
        self.present(NotificationViewController(),animated: true)
    }
    
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
        //        let navVC = UINavigationController(rootViewController: child)
        //        navVC.isNavigationBarHidden = true
        child.transitioningDelegate = transition   // 2
        child.modalPresentationStyle = .custom  // 3
        height = view.frame.height * 0.60
        transition.height = height
        self.navigationController?.present(child, animated: true)
        
    }
    
    @objc func mastersFunc(){
        let newVc = MastersViewController()
        DispatchQueue.main.async {
            let backItem = UIBarButtonItem()
            backItem.title = "Назад"
            self.navigationItem.backBarButtonItem = backItem
            self.navigationItem.backBarButtonItem?.tintColor = .black
            self.navigationItem.title = "Мастера"
            self.navigationController?.navigationBar.topItem?.title = "Мастера"
            self.navigationController?.pushViewController(newVc, animated: true)
        }
        
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
        var trueVC = ServicesTableViewController()
        var falseVC = FirstAuthViewController()
        DispatchQueue.main.async {
            if authorization == false {
                self.present(falseVC, animated: true, completion: nil)
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
    
    @objc func toStudioFunc(){
        
        let newVc = GeolocationViewController()
        DispatchQueue.main.async {
            let backItem = UIBarButtonItem()
            print("Пришло")
            backItem.title = "Назад"
            
            self.navigationItem.backBarButtonItem = backItem
            self.navigationItem.backBarButtonItem?.tintColor = .black
            self.navigationController?.pushViewController(newVc, animated: true)
        }
    }
    
//    @objc func authFunc(){
//        self.present(AuthWithPasswordViewController(), animated: true, completion: nil)
//    }
}

