//
//  UserViewController.swift
//  HabitBread
//
//  Created by 염준우 on 2021/01/01.
//

import Foundation
import UIKit

class UserViewController: UIViewController {
    private var handler: ((Result<User, Error>) -> Void)!
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var breadLabel: UILabel!
    @IBOutlet weak var expLabel: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handler = {[weak self] result in
        guard let self = self else { return }
        switch result {
            case .success(let response):
                self.updateUI(response: response)
            case .failure(let error):
                print("Error", error.localizedDescription)
            }
        }
        APIManager.shared.getUser(completionHandler: handler)
    }
    
    func updateUI(response: User) {
        DispatchQueue.main.async {
            self.userNameLabel.text = response.name
            self.breadLabel.text = "\(response.itemTotalCount)"
            self.expLabel.text = "\(response.exp)"
            self.percentageLabel.text = "\(response.percent)%"
        }
    }
    
    @IBAction func goToSettings(_ sender: Any) {
        performSegue(withIdentifier: "openSettings", sender: nil)
    }
}
