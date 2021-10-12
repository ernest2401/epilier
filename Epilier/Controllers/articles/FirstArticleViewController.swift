//
//  FirstArticleViewController.swift
//  Epilier
//
//  Created by Ernest Migranov on 06.10.2021.
//

import Foundation
import UIKit

class FirstArticleViewController: UIViewController{
    let photo = UIImageView(image: UIImage(named: "articlePhoto"))
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        //label.backgroundColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 23)
        label.text = "Рассказываем про уход за лицом"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        //label.backgroundColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Mus sollicitudin aliquet nunc adipiscing dui tempor. Venenatis fermentum hendrerit tincidunt semper. Fermentum vulputate ac et sed in id imperdiet. Fringilla eget auctor tortor, in lectus. Ac tortor proin egestas mi diam consectetur mi, malesuada. Mauris, nec lorem eu est ac luctus sagittis in. Velit orci convallis ligula risus sed. Nisi, tincidunt at quis lectus cras semper velit. Purus condimentum diam et mauris consectetur rhoncus, odio rutrum nisl. Posuere cursus ut sed quam luctus. Proin urna consequat libero, sed nunc, enim vitae malesuada. Quis eget in gravida phasellus sed in cras. Lacus fermentum mauris, pretium tristique ultrices et, hac. Nunc sem tempor et vel turpis massa ut adipiscing nisl. Id lectus ultrices duis id integer. Lacus, bibendum id at odio tincidunt nibh pellentesque egestas dui. At integer diam volutpat eget tempor vulputate."
        label.textColor = .gray
        label.sizeToFit()
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "closeButton"), for: .normal)
        //button.backgroundColor = .black
        button.addTarget(self, action: Selector("firstButtonFunc"), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        self.view.addSubview(photo)
        self.view.addSubview(titleLabel)
        self.view.addSubview(textLabel)
        self.view.addSubview(closeButton)
        view.backgroundColor = .white
        super.viewDidLoad()
        setConstraints()
    }
    
    func setConstraints(){
        photo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            photo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            photo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            photo.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            titleLabel.topAnchor.constraint(equalTo: photo.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
        ])
        
        }
    
    @objc func firstButtonFunc(){
        self.dismiss(animated: true)
    }
}
