//
//  GeolocationTableViewCell.swift
//  Epilier
//
//  Created by Ernest Migranov on 25.10.2021.
//

import Foundation
import UIKit


class GeolocationTableViewCell: UITableViewCell {
    
    var image = UIImageView(image: UIImage(named: "geolocationIcon"))
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor(hexString: "#C8EFF4")
        //label.font = UIFont(name: "SF Pro Text", size: 17)
        //label.font = UIFont.init(name: "SF Pro Text", size: 17)
        label.font = UIFont.init(name: "SFProDisplay-Semibold", size: 19)
        label.text = "Казань"
        label.textColor = .black
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var studiesLabel: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor(hexString: "#C8EFF4")
        //label.font = UIFont(name: "SF Pro Text", size: 17)
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "12 студий"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(image)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(studiesLabel)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints(){
        image.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            studiesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            studiesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
        ])
    }
}


