//
//  HabitViewController.swift
//  HabitBread
//
//  Created by 염준우 on 2020/12/27.
//

import UIKit

class HabitViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let nameList = ["Brook", "Chopper", "Franky", "Luffy", "Nami", "Robin", "Sanji", "Zoro"]
    let bountyList = [33000000, 50, 44000000, 300000000, 16000000, 80000000, 77000000, 120000000]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bountyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "habitCell", for: indexPath)
//        return cell
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "habitCell", for: indexPath) as? HabitListViewCell else { return UITableViewCell() }
        cell.nameLabel.text = nameList[indexPath.row]
        cell.bountyLabel.text = "\(bountyList[indexPath.row])"
        
        return cell
    }
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        performSegue(withIdentifier: "showDetail", sender: nil)
    }
}

class HabitListViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
}
