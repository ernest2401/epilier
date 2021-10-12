//
//  Menu.swift
//  Epilier
//
//  Created by Ernest Migranov on 01.10.2021.
//

import Foundation
import UIKit

struct Menu {
    var subMenu: String!
    var menu: [String]!
    var isStatus: Bool!
    var images: [String]

    
    init(subMenu: String,menu: [String], isStatus: Bool,images: [String]){
        self.subMenu = subMenu
        self.menu = menu
        self.isStatus = isStatus
        self.images = images
    }
}

struct Program {
    var name: String
    var price: String
    var time: String
}
