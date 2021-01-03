//
//  SignInViewController.swift
//  HabitBread
//
//  Created by 염준우 on 2020/12/27.
//
import UIKit
import GoogleSignIn

class SignInViewController : UIViewController {
    
    
    @IBOutlet weak var googleLoginButton: GIDSignInButton!
    
    override func viewDidLoad() {
        GIDSignIn.sharedInstance()?.presentingViewController = self
    
        NotificationCenter.default.addObserver(self, selector: #selector(authenticateToServer(_:)), name: .signInGoogleCompleted, object: nil)
    }
    
    
    @IBAction func showLoginView(_ sender: Any) {
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    
    @objc private func authenticateToServer(_ notification: Notification) {
        
    }
}
