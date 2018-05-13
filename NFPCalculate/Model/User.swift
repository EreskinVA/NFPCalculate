//
//  User.swift
//  NFPCalculate
//
//  Created by EVladimirA on 13.05.2018.
//  Copyright © 2018 Ereskin Vladimir. All rights reserved.
//

import Foundation
import Firebase

struct UserC {
    let uid: String
    let email: String
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email!
    }
}
