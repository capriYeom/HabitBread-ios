//
//  HabitViewController.swift
//  HabitBread
//
//  Created by 염준우 on 2020/12/27.
//

import UIKit

class HabitViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let animals: [String] = ["Horse", "Cow", "Camel", "Sheep", "Goat"]
      
    let cellReuseIdentifier = "habitCell"
    let cellSpacingHeight: CGFloat = 5
      
    @IBOutlet var tableView: UITableView!
      
    override func viewDidLoad() {
        super.viewDidLoad()
      }
      
    // There is just one row in every section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
        guard let cell = (self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? HabitListViewCell) else { return UITableViewCell() }
          
        // note that indexPath.section is used rather than indexPath.row
        cell.nameLabel?.text = self.animals[indexPath.section]
        cell.bountyLabel.text = self.animals[indexPath.section]
        
        cell.backgroundColor = UIColor.white
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.cornerRadius = 12
        cell.clipsToBounds = true
        
        return cell
    }
      
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // note that indexPath.section is used rather than indexPath.row
        print("You tapped cell number \(indexPath.section).")
    }
  }


class HabitListViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
}
