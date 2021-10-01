//
//  ExpandableHeaderViewDelegate.swift
//  Epilier
//
//  Created by Ernest Migranov on 01.10.2021.
//

import Foundation
import UIKit

protocol ExpandableHeaderViewDelegate {
    func toggleSection(header: ExpandableHeaderView, section: Int)
}

class ExpandableHeaderView: UITableViewHeaderFooterView{
    
    lazy var expandButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        //button.setTitle("Записаться", for: .normal)
        button.setImage(UIImage(named: "expandButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    var expanding : Bool = false
    var section: Int!
    var delegate: ExpandableHeaderViewDelegate?
    
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        let tapHeader = UITapGestureRecognizer(target: self, action: #selector(clickingOnSubMenu))
        self.addGestureRecognizer(tapHeader)
        self.contentView.addSubview(expandButton)
        setConstraints()
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            expandButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            expandButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
//            signUpLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
//            signUpLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func clickingOnSubMenu(gestureRecognizer: UITapGestureRecognizer) {
        let cell = gestureRecognizer.view as! ExpandableHeaderView
        delegate?.toggleSection(header: self, section: cell.section)
        expanding = !expanding
        switch expanding {
        case true:
            expandButton.setImage(UIImage(named: "hideButton"), for: .normal)
        case false:
            expandButton.setImage(UIImage(named: "expandButton"), for: .normal)
        }
    }
    
    func customInit(title: String,section: Int, delegate: ExpandableHeaderViewDelegate){
        self.textLabel?.text = title
        self.section = section
        self.delegate = delegate
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.textLabel?.textColor = .black
        self.contentView.backgroundColor = .white
        self.textLabel?.font = UIFont.boldSystemFont(ofSize: 17)
    }
}

