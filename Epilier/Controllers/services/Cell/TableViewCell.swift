//
//  TableViewCell.swift
//  Epilier
//
//  Created by Ernest Migranov on 01.10.2021.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell{
    let image : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image1")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor(hexString: "#C8EFF4")
        label.font = UIFont(name: "SF Pro Text", size: 14)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let moneyImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "moneyImage")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor(hexString: "#C8EFF4")
        label.font = UIFont(name: "SF Pro Text", size: 8)
        label.numberOfLines = 1
        label.text = "1200 ₽"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let timeImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "timeImage")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor(hexString: "#C8EFF4")
        label.font = UIFont(name: "SF Pro Text", size: 8)
        label.numberOfLines = 1
        label.text = "45 мин"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(image)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(moneyImage)
        self.contentView.addSubview(priceLabel)
        self.contentView.addSubview(timeImage)
        self.contentView.addSubview(timeLabel)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            //image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
            image.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.6),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            titleLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.35),
            moneyImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            moneyImage.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            moneyImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.21),
            moneyImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.03),
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            priceLabel.leadingAnchor.constraint(equalTo: moneyImage.trailingAnchor, constant: 5),
            priceLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.21),
            timeImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            timeImage.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 20),
            timeImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.18),
            //timeImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.03),
            timeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            timeLabel.leadingAnchor.constraint(equalTo: timeImage.trailingAnchor, constant: 5),
            timeLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.2),
            
        ])
    }
}

