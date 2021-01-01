//
//  SettingsNavigationController.swift
//  HabitBread
//
//  Created by 염준우 on 2021/01/01.
//

import UIKit

class SettingsNavigationController: UINavigationController {
    override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        return super.popToRootViewController(animated: true)
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        return super.pushViewController(viewController, animated: true)
    }
}
