//
//  SplashScreenViewController.swift
//  MVVM_prototype
//
//  Created by Eduardo Hoffmann on 19/06/23.
//

import UIKit

class SplashScreenViewController: UIViewController {
    
    //MARK:-- Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
      
        navigationController?.setNavigationBarHidden(true, animated: true )
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginViewController" {
            let vc = segue.destination as! LoginViewController
            vc.modalPresentationStyle = .fullScreen
        }
        
        if segue.identifier == "registerViewController" {
            let vc = segue.destination as! RegisterViewController
            vc.modalPresentationStyle = .fullScreen
        }
    }
    
    //MARK:-- Actions
    
    @IBAction func unwindViewLogin(segue: UIStoryboardSegue) {
        
    }
}
