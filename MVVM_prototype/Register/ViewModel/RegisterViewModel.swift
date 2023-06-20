//
//  RegisterViewModel.swift
//  MVVM_prototype
//
//  Created by Eduardo Hoffmann on 19/06/23.
//


import Firebase
import FirebaseAuth
import FirebaseDatabase

//MARK:-- Protocol

protocol RegisterViewDelegate: AnyObject {
    func didRegisterUser() //with email: String, password: String, name: String
    func registerdidFail(with error: Error)
    func alert(with alert: String)
}

class RegisterViewModel {
    
    //MARK:-- Variables
    
    weak var delegate: RegisterViewDelegate?
    
    //MARK:-- Méthods
    
    func register(with email: String, password: String, name: String) {
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (authResult, error) in
            if let error = error {
                self?.delegate?.registerdidFail(with: error)
                return
            }
            guard let uid = authResult?.user.uid else {
                return
            }
            
            let userData = ["name": name, "email": email]
            
            let userRef = Database.database().reference().child("users").child(uid)
            userRef.setValue(userData) { (error, _) in
                
                if let error = error {
                    self?.delegate?.registerdidFail(with: error)
                    return
                }
                self?.delegate?.didRegisterUser()
            }
        }
    }
}


