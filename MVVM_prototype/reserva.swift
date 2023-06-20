//
//  reserva.swift
//  MVVM_prototype
//
//  Created by Eduardo Hoffmann on 20/06/23.
//

import Foundation
//
//  LoginViewController.swift
//  MVVM_prototype
//
//  Created by Eduardo Hoffmann on 19/06/23.
//

import UIKit

/*
class LoginViewController: UIViewController, AuthenticationViewDelegate {
   
    //MARK:--  Outlets
    
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    //MARK:-- Variables
    
    private var loginViewModel = LoginViewModel()
    
    //MARK:-- Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginViewModel = LoginViewModel()
        loginViewModel.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
          navigationController?.setNavigationBarHidden(false, animated: true )
       }
    
    //MARK:-- Méthods
    
    func didLoginUser() {
        performSegue(withIdentifier: "segueHome", sender: nil)
    }
       
    func authenticationDidFail(with error: Error) {
        AlertMessage.alert(title: "Erro", message: "\(error)", viewController: self)
    }
    
    //MARK:-- Actions
    
    @IBAction func openTap(_ sender: UIButton) {
        guard let emailUser = loginTextField.text,
              let passwordUser = passwordTextField.text else {
            return
        }
        loginViewModel.login(with: emailUser, password: passwordUser)
    }
}

*/
