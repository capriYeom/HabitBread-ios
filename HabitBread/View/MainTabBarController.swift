//
//  MainTabBarController.swift
//  HabitBread
//
//  Created by 염준우 on 2021/01/09.
//

import Foundation
import UIKit

class MainTabBarController : UITabBarController{
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
}

extension MainTabBarController : UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let isModalView = viewController is CreationViewController
        
        if isModalView {
            performSegue(withIdentifier: "showCreation", sender: nil)
            return false
        }
        return true
    }
}
