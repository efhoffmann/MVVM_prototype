//
//  LoginViewModel.swift
//  MVVM_prototype
//
//  Created by Eduardo Hoffmann on 19/06/23.
//

import UIKit
import FirebaseAuth

//MARK:-- Protocol

protocol AuthenticationViewDelegate: AnyObject {
    func didLoginUser()
    func authenticationDidFail(with error: Error)
}

class LoginViewModel {
    
    //MARK:-- Variables
    
    weak var delegate: AuthenticationViewDelegate?
    var userLogged: String?
    
    //MARK:-- Méthods
    
    func login(with email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (authResult, error) in
            if let error = error {
                self?.delegate?.authenticationDidFail(with: error)
                return
            }
            let userLogged = authResult?.user.displayName ?? ""
            self?.userLogged = userLogged
            self?.delegate?.didLoginUser()
        }
    }
}
