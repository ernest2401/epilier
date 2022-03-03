//
//  StudiosTableViewCell.swift
//  Epilier
//
//  Created by Ernest Migranov on 30.11.2021.
//

import Foundation
import UIKit

class StudiosTableViewCell: UITableViewCell {
    
    let image = UIImageView(image: UIImage(named: "mapPhoto"))
    let star = UIImageView(image: UIImage(named: "Star"))
    let point = UIImageView(image: UIImage(named: "point"))
    
    var city_id: Int = 0
    
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
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor(hexString: "#C8EFF4")
        //label.font = UIFont(name: "SF Pro Text", size: 17)
        //label.font = UIFont.init(name: "SF Pro Text", size: 17)
        label.font = UIFont.init(name: "SFProDisplay-Semibold", size: 19)
        label.text = "Epilier на ул.Павлюхина, 25"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let markLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "4.7"
        label.backgroundColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    let amountLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "128 отзывов"
        label.backgroundColor = .white
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .gray
        return label
    }()
    
    lazy var timeLabel: UIButton = {
        let button = UIButton()
        button.setTitleColor(.gray, for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.setTitle("Ближаший сеанс", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var timeLabelAnswer: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.setTitle("12 сен в 12.00", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var workingHours: UIButton = {
        let button = UIButton()
        button.setTitleColor(.gray, for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.setTitle("Режим работы", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var workingHoursAnswer: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.setTitle("Пн. -Вс. 10:00-20:00", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(button)
        self.button.addSubview(titleLabel)
        self.button.addSubview(amountLabel)
        self.button.addSubview(markLabel)
        self.button.addSubview(star)
        self.button.addSubview(point)
        self.button.addSubview(image)
        self.button.addSubview(timeLabel)
        self.button.addSubview(timeLabelAnswer)
        self.button.addSubview(workingHours)
        self.button.addSubview(workingHoursAnswer)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints(){
        image.translatesAutoresizingMaskIntoConstraints = false
        star.translatesAutoresizingMaskIntoConstraints = false
        point.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            
            
            titleLabel.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: button.topAnchor, constant: 10),
            star.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 10),
            star.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            star.heightAnchor.constraint(equalTo: button.heightAnchor, multiplier: 0.08),
            markLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            markLabel.leadingAnchor.constraint(equalTo: star.trailingAnchor, constant: 5),
            point.leadingAnchor.constraint(equalTo: markLabel.trailingAnchor, constant: 5),
            point.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),

            amountLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            amountLabel.leadingAnchor.constraint(equalTo: point.trailingAnchor, constant: 10),

            image.topAnchor.constraint(equalTo: amountLabel.bottomAnchor,constant: 5),
            image.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -10),
            image.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 10),
            image.heightAnchor.constraint(equalTo: button.heightAnchor, multiplier: 0.39),
            timeLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 5),
            timeLabel.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 10),
            timeLabelAnswer.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 0),
            timeLabelAnswer.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 10),
            
            workingHours.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 5),
            workingHours.leadingAnchor.constraint(equalTo: button.centerXAnchor, constant: 10),
            workingHoursAnswer.topAnchor.constraint(equalTo: workingHours.bottomAnchor, constant: 0),
            workingHoursAnswer.leadingAnchor.constraint(equalTo: button.centerXAnchor, constant: 10),
            
            
        ])
    }
    
}

