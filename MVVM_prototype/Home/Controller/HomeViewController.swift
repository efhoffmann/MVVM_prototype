//
//  HomeViewController.swift
//  MVVM_prototype
//
//  Created by Eduardo Hoffmann on 19/06/23.
//

import UIKit


class HomeViewController: UIViewController, UserDetailViewDelegate {
    
    //MARK:-- IBOutles
    
    @IBOutlet var homeLabel: UILabel!

    //MARK:-- Variables
    
    var homeViewModel: HomeViewModel!
    
    //MARK:-- Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       homeViewModel = HomeViewModel()
       homeViewModel.delegate = self
       homeViewModel.fetchUserName()
    }
    
    override func viewWillAppear(_ animated: Bool) {
          
          navigationController?.setNavigationBarHidden(true, animated: true )
           
    }
    
    //MARK:-- Actions
    
    @IBAction func exitTap(_ sender: Any) {
        
    }

    //MARK:-- Méthods
    
    func didSetUserName(_ name: String) {
        homeLabel.text = ("Bem vindo a devX \(name)")

    }
}
