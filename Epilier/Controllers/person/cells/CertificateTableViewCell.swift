//
//  CertificateTableViewCell.swift
//  Epilier
//
//  Created by Ernest Migranov on 25.11.2021.
//

import Foundation
import UIKit

class CertificateTableViewCell: UITableViewCell {
    
    lazy var button : UIView = {
        let b = UIView()
        b.translatesAutoresizingMaskIntoConstraints = false
        
        b.backgroundColor = .white
        //b.layer.shadowColor = UIColor.black.cgColor
        b.layer.shadowRadius = 3.0
        b.layer.shadowOpacity = 0.4
        b.layer.shadowOffset = CGSize(width: 0.4, height: 0.4)
    
        b.layer.cornerRadius = 10
        
        return b
    }()
    
    let activityLabel: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor(hexString: "#C8EFF4")
        label.font = UIFont(name: "SF Pro Text", size: 14)
        label.textColor = #colorLiteral(red: 0.3246983886, green: 0.7665559649, blue: 0.106477119, alpha: 1)
        label.text = " Активирован "
        label.backgroundColor = #colorLiteral(red: 0.9661299586, green: 1, blue: 0.926908493, alpha: 1)
        label.layer.borderColor = #colorLiteral(red: 0.3246983886, green: 0.7665559649, blue: 0.106477119, alpha: 1)
        label.layer.borderWidth = 1.0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Абонемент на 12 посещений"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let balanceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(button)
        self.button.addSubview(activityLabel)
        self.button.addSubview(label)
        self.button.addSubview(balanceLabel)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            activityLabel.topAnchor.constraint(equalTo: button.topAnchor, constant: 10),
            activityLabel.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 10),
            label.topAnchor.constraint(equalTo: activityLabel.topAnchor, constant: 25),
            label.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 10),
            balanceLabel.topAnchor.constraint(equalTo: label.topAnchor, constant: 25),
            balanceLabel.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 10),
            
            
            
            
        ])
    }
    
    override open var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame =  newFrame
            //frame.origin.y += 10
            //frame.origin.x += 10
            frame.size.height -= 15
            super.frame = frame
        }
    }
    
}
