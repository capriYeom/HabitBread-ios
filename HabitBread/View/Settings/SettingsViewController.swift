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
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: "inviteUser", sender: nil)
        case 1:
            performSegue(withIdentifier: "setNotification", sender: nil)
        case 2:
            performSegue(withIdentifier: "showHelp", sender: nil)
        case 3:
            performSegue(withIdentifier: "showInformation", sender: nil)
        case 5:
            signOut()
        case 6:
            deleteAccount()
        default:
            return
        }
    }
        
    func signOut() {
    
    }
    
    func deleteAccount() {
        
    }
}
