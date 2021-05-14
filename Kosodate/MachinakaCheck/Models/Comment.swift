//
//  Comment.swift
//  Kosodate
//
//  Created by Rienhardt on 2019/06/23.
//  Copyright © 2019 Richard Han. All rights reserved.
//
import Foundation

struct Comment {
    
    let user: User
    
    let text: String
    let uid: String
    
    init(user: User, dictionary: [String: Any]) {
        self.user = user
        self.text = dictionary["text"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
    }
}
