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
        
        AlertMessage.alert(title: "Erro", message: "\(error)", viewController: self)
    }
    
    func alert(with alert: String) {
        registerdidFail(with: alert as! Error)
    }
    
}
