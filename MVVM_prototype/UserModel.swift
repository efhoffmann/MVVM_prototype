//
//  UserModel.swift
//  MVVM_prototype
//
//  Created by Eduardo Hoffmann on 19/06/23.
//

import Foundation

struct UserModel {
    
    var name: String
    var email: String
    var password: String
    var repeatPassword: String
    
    init(name: String, email: String, password: String, repeatPassword: String) {
        self.name = name
        self.email = email
        self.password = password
        self.repeatPassword = repeatPassword
    }
}
