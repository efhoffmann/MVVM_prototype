//
//  SplashScreenViewModel.swift
//  MVVM_prototype
//
//  Created by Eduardo Hoffmann on 19/06/23.
//

import Foundation
import UIKit

class SplashScreenViewModel: UIViewController {
    
    //MARK:-- Variables
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 178, height: 172))
        imageView.image = UIImage(named: "devx")
        
        return imageView
    }()
    
    //MARK:-- Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            self.performSegue(withIdentifier: "mainSegue", sender: nil)
            
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.setNavigationBarHidden(false, animated: true )
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mainSegue" {
            let vc = segue.destination as! SplashScreenViewController
            vc.modalPresentationStyle = .fullScreen
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
            self.animate()
        })
    }
    
    //MARK:-- Méthods
    
    private func animate() {
        UIView.animate(withDuration: 1) {
            let size = self.view.frame.size.width * 4
            let diffX = size - self.view.frame.size.width
            let diffY = self.view.frame.size.height - size
            
            self.imageView.frame = CGRect(x: -(diffX)/2,
                                          y: diffY/2,
                                          width: size,
                                          height: size)
            self.imageView.alpha = 0
        }
    }
}
