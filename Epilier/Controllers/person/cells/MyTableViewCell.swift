//
//  MyTableViewCell.swift
//  Epilier
//
//  Created by Ernest Migranov on 07.10.2021.
//

import Foundation
import UIKit

class MyTableViewCell: UITableViewCell {
    
    var choosed : Bool = false
    
    var id: Int = 0
    
    let icon : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "round")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let titleLabel : UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(icon)
        self.contentView.addSubview(titleLabel)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            icon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            icon.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.05),
            icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            icon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 18),
//            icon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -18),
            
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: icon.leadingAnchor, constant: -5),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
        ])
    }
}
