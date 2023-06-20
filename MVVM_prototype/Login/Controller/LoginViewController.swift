//
//  LoginViewController.swift
//  MVVM_prototype
//
//  Created by Eduardo Hoffmann on 19/06/23.
//

import UIKit

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
        self.error(type: error as NSError)
    }
    
    func error(type: NSError) {
        if let errorCode = type.userInfo["FIRAuthErrorUserInfoNameKey"] {
            let textError = errorCode as! String
            var errorMessage = ""
            
            switch textError {
            case "ERROR_WRONG_PASSWORD":
                AlertMessage.alert(title: "Erro", message: "Usuário ou senha inválidos.", viewController: self)
            case "ERROR_WEAK_PASSWORD":
                AlertMessage.alert(title: "Erro", message: "Senha inválida.", viewController: self)
            default:
                AlertMessage.alert(title: "Erro", message: "Erro 404.", viewController: self)
            }
        }
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

