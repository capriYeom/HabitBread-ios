//
//  AccountViewController.swift
//  HabitBread
//
//  Created by 염준우 on 2020/12/29.
//

import UIKit

class AccountViewController: UIViewController {
    
   
    @IBAction func OpenSettings(_ sender: Any) {
        performSegue(withIdentifier: "goToSettings", sender: nil)
    }
}
