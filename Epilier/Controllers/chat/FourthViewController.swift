//
//  FourthViewController.swift
//  Epilier
//
//  Created by Ernest Migranov on 06.10.2021.
//

import Foundation
import UIKit
import MessageKit


struct Sender: SenderType{
    var senderId: String
    
    var displayName: String
    
    
}

struct Message: MessageType{
    var sender: SenderType
    
    var messageId: String
    
    var sentDate: Date
    
    var kind: MessageKind
    
    
}

struct Media: MediaItem{
    var url: URL?
    
    var image: UIImage?
    
    var placeholderImage: UIImage
    
    var size: CGSize
    
    
}


//class FourthViewController: MessagesViewController,MessagesDataSource,MessagesLayoutDelegate,MessagesDisplayDelegate {
//
//
//    let currentUser = Sender(senderId: "self", displayName: "John")
//    let otherUser = Sender(senderId: "other", displayName: "Vasya")
//
//    var messages = [Message]()
//
//    let bottomView : UIView = {
//        var label = UIView()
//        label.backgroundColor = .white
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.layer.shadowColor = UIColor.black.cgColor
//        label.layer.shadowOffset = CGSize(width: 0.0, height: -2.0)
//        label.layer.shadowRadius = 3.0
//        label.layer.shadowOpacity = 0.08
//        label.layer.masksToBounds = false
//        label.layer.borderWidth = 0.23
//        label.layer.borderColor = UIColor.gray.cgColor
////        label.clipsToBounds = true
//        return label
//    }()
//
//    lazy var button: UIButton = {
//       let button = UIButton()
//        button.backgroundColor = .blue
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//
//    lazy var textView: UITextField = {
//       let textView = UITextField()
//        textView.translatesAutoresizingMaskIntoConstraints = false
//        textView.placeholder = "Сообщение"
//        return textView
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.view.addSubview(button)
//        self.view.addSubview(bottomView)
//        self.bottomView.addSubview(textView)
//        setConstraints()
//        messages.append(Message(sender: currentUser, messageId: "1", sentDate: Date(), kind: .photo(Media(url: nil, image:  UIImage(named: "image1"), placeholderImage: UIImage(named: "image1")!, size: CGSize(width: 250, height: 200)))))
//        messages.append(Message(sender: otherUser, messageId: "2", sentDate: Date(), kind: .photo(Media(url: nil, image:  UIImage(named: "image1"), placeholderImage: UIImage(named: "image1")!, size: CGSize(width: 250, height: 200)))))
//        messages.append(Message(sender: currentUser, messageId: "3", sentDate: Date(), kind: .photo(Media(url: nil, image:  UIImage(named: "image1"), placeholderImage: UIImage(named: "image1")!, size: CGSize(width: 250, height: 200)))))
//        messages.append(Message(sender: otherUser, messageId: "Поаоао", sentDate: Date().addingTimeInterval(-1000), kind: .text("Записаться на услугу")))
//
//        messagesCollectionView.messagesDataSource = self
//        messagesCollectionView.messagesLayoutDelegate = self
//        messagesCollectionView.messagesDisplayDelegate = self
//
//        self.navigationItem.title = "Профиль"
//
//    }
//
//    func currentSender() -> SenderType {
//        currentUser
//    }
//
//    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
//        return messages[indexPath.section]
//    }
//
//    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
//        return messages.count
//    }
//
//    func setConstraints(){
//        NSLayoutConstraint.activate([
//            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120),
//            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -88),
//            bottomView.widthAnchor.constraint(equalTo: view.widthAnchor),
//            bottomView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.09),
//            textView.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor),
//            textView.widthAnchor.constraint(equalTo: bottomView.widthAnchor, multiplier: 0.94),
//            textView.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
//            textView.heightAnchor.constraint(equalTo: bottomView.heightAnchor, multiplier: 0.94),
//        ])
//    }
//}

class FourthViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
