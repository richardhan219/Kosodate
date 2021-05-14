//
//  User.swift
//  Kosodate
//
//  Created by Rienhardt on 2019/06/21.
//  Copyright © 2019 Richard Han. All rights reserved.
//
import Foundation

struct User {
    
    let uid: String
    let username: String
    let profileImageUrl: String
    
    init(uid: String, dictionary: [String: Any]) {
        self.uid = uid
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"]  as? String ?? ""
    }
}
