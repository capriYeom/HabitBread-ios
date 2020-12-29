//
//  SettingsNavigationController.swift
//  HabitBread
//
//  Created by 염준우 on 2020/12/29.
//

import UIKit

class SettingsViewController: UITableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        if indexPath.row == 3 {
            performSegue(withIdentifier: "showHelp", sender: nil)
        }
    }
        
    func signOut() {
    
    }
    
    func deleteAccount() {
        
    }
}
