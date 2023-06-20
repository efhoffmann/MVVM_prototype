//
//  RegisterViewController.swift
//  MVVM_prototype
//
//  Created by Eduardo Hoffmann on 19/06/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class RegisterViewController: UIViewController, RegisterViewDelegate {
    
    //MARK:--  Outlets
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var repeatPasswordTextField: UITextField!
    
    //MARK:-- Variables
    
    var registerViewModel: RegisterViewModel!
    
    //MARK:-- Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerViewModel = RegisterViewModel()
        registerViewModel.delegate = self
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
          navigationController?.setNavigationBarHidden(false, animated: true )
       }
    
    
    //MARK:-- Actions

    @IBAction func registerTap(_ sender: Any) {
        
        guard  let nameUser = nameTextField.text,
              let emailUser = emailTextField.text,
              let passwordUser = passwordTextField.text else {
            return
        }
        registerViewModel.register(with: emailUser, password: passwordUser, name: nameUser)
    }
    
    @IBAction func cleanTap(_ sender: UIButton) {
        nameTextField.text = ""
        emailTextField.text = ""
        passwordTextField.text = ""
        repeatPasswordTextField.text = ""
    }
    
    //MARK:-- Méthods
    
    func didRegisterUser() {
        performSegue(withIdentifier: "segueHome", sender: nil)
    }
    
    func registerdidFail(with error: Error) {
        self.error(type: error as NSError)
    }
    
    func error(type: NSError) {
        if let errorCode = type.userInfo["FIRAuthErrorUserInfoNameKey"] {
            let textError = errorCode as! String
            var errorMessage = ""
            
            switch textError {
            case "ERROR_EMAIL_ALREADY_IN_USE":
                AlertMessage.alert(title: "Erro", message: "E-mail em uso. Escolha outro endereço.", viewController: self)
            case "ERROR_WEAK_PASSWORD":
                AlertMessage.alert(title: "Erro", message: "A senhas devem ter no mínimo 6 caracteres e devem ser iguais.", viewController: self)
            case "ERROR_INVALID_EMAIL":
                AlertMessage.alert(title: "Erro", message: "Formato de e-mail inválido.", viewController: self)
            case "ERROR_MISSING_EMAIL":
                AlertMessage.alert(title: "Erro", message: "Um endereço de e-mail deve ser fornecido.", viewController: self)
            default:
                AlertMessage.alert(title: "Erro", message: "Erro 404.", viewController: self)
            }
        }
    }
    
    func alert(with alert: String) {
        registerdidFail(with: alert as! Error)
    }
    
}
