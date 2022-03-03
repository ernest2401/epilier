//
//  DetailCertificateTableViewCell.swift
//  Epilier
//
//  Created by Ernest Migranov on 16.02.2022.
//

import Foundation
import UIKit

class DetailCertificateTableViewCell: UITableViewCell{
    
    let image : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image1")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor(hexString: "#C8EFF4")
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelCount: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor(hexString: "#F5F5F5")
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = " 4/6 "
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        label.layer.borderWidth = 0.02
        return label
    }()
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews(){
        self.contentView.addSubview(image)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(labelCount)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            //image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
            image.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.6),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            titleLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.65),
            labelCount.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            labelCount.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
        ])
    }
}
