//
//  SignInViewController.swift
//  HabitBread
//
//  Created by 염준우 on 2020/12/27.
//
import UIKit
import GoogleSignIn

class SignInViewController : UIViewController {
    
    private var googleHandler: ((Result<GoogleOAuthResponse, Error>) -> Void)!
    @IBOutlet weak var googleLoginButton: GIDSignInButton!
    
    override func viewDidLoad() {
        GIDSignIn.sharedInstance()?.presentingViewController = self
    
        NotificationCenter.default.addObserver(self, selector: #selector(authenticateToServer(_:)), name: .signInGoogleCompleted, object: nil)
    }
    
    
    @IBAction func showLoginView(_ sender: Any) {
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    
    @objc private func authenticateToServer(_ notification: Notification) {
        googleHandler = {  [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                Config.accessToken = response.accessToken
                self.performSegue(withIdentifier: "Login", sender: nil)
            case .failure(let error):
                print("Error", error.localizedDescription)
            }
        }
        APIManager.shared.authenticateGoogle(idToken: (GIDSignIn.sharedInstance()?.currentUser.authentication.idToken)!, completionHandler: googleHandler)
    }
}
