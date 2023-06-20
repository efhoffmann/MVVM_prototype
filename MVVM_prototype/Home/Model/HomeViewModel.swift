//
//  HomeViewModel.swift
//  MVVM_prototype
//
//  Created by Eduardo Hoffmann on 20/06/23.
//

import Firebase

//MARK:-- Protocols

protocol UserDetailViewDelegate: AnyObject {
    func didSetUserName(_ name: String)
}

class HomeViewModel {
    
    //MARK:-- Variables
    
    weak var delegate: UserDetailViewDelegate?
    
    //MARK:-- Méthods
    
    func fetchUserName() {
        guard let currentUserId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let userRef = Database.database().reference().child("users").child(currentUserId)
        userRef.observeSingleEvent(of: .value) { [weak self] snapshot in
            if let userData = snapshot.value as? [String: Any],
               let userName = userData["name"] as? String {
                self?.delegate?.didSetUserName(userName)
            }
        }
    }
}
