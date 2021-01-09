//
//  HabitViewController.swift
//  HabitBread
//
//  Created by 염준우 on 2020/12/27.
//

import UIKit

class HabitViewController: UIViewController {
    
    enum SortType {
        case ALL, MON, TUE, WED, THU, FRI, SAT, SUN
    }
    
    var habits: [Habit]? = [Habit(habitId: 0, title: "Habit", description: "Description", dayOfWeek: "0000000",percent: 0, commitHistory: [])]
    var reusableHabits: [Habit]? = []
    let cellReuseIdentifier = "habitCell"
    let cellSpacingHeight: CGFloat = 10
      
    @IBOutlet var habitTableView: UITableView!
    @IBOutlet weak var commentTextView: UILabel!
    
    private var handler: ((Result<HabitListResponse, Error>) -> Void)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handler = { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.updateUI(response: response)
            case .failure(let error):
                print("Error", error.localizedDescription)
            }
        }
        APIManager.shared.getAllHabits(completionHandler: handler)
    }
    
    @IBAction func seeAllHabits(_ sender: Any) {
        sortHabitList(sortType: .ALL)
    }
    
    @IBAction func seeMonday(_ sender: Any) {
        sortHabitList(sortType: .MON)
    }
    
    @IBAction func seeTuesday(_ sender: Any) {
        sortHabitList(sortType: .TUE)
    }
    
    @IBAction func seeWednesday(_ sender: Any) {
        sortHabitList(sortType: .WED)
    }
    
    @IBAction func seeThursday(_ sender: Any) {
        sortHabitList(sortType: .THU)
    }
    
    @IBAction func seeFriday(_ sender: Any) {
        sortHabitList(sortType: .FRI)
    }
    
    @IBAction func seeSaturday(_ sender: Any) {
        sortHabitList(sortType: .SAT)
    }
    
    @IBAction func seeSunday(_ sender: Any) {
        sortHabitList(sortType: .SUN)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? HabitDetailViewController
            
            if let index = sender as? Int {
                print("Preparing \(index)")
                vc?.habit = habits?[index]
            }
        }
    }
      
    private func sortHabitList(sortType: SortType) {
        let sortedHabitList: [Habit]?
        switch sortType {
        case .MON:
            sortedHabitList = habits?.filter {$0.dayOfWeek[0] == "1"}
        case .TUE:
            sortedHabitList = habits?.filter {$0.dayOfWeek[1] == "1"}
        case .WED:
            sortedHabitList = habits?.filter {$0.dayOfWeek[2] == "1"}
        case .THU:
            sortedHabitList = habits?.filter {$0.dayOfWeek[3] == "1"}
        case .FRI:
            sortedHabitList = habits?.filter {$0.dayOfWeek[4] == "1"}
        case .SAT:
            sortedHabitList = habits?.filter {$0.dayOfWeek[5] == "1"}
        case .SUN:
            sortedHabitList = habits?.filter {$0.dayOfWeek[6] == "1"}
        default:
            sortedHabitList = habits
        }
        DispatchQueue.main.async {
            self.reusableHabits = sortedHabitList
            self.habitTableView.reloadData()
        }
    }
    
    // There is just one row in every section
    private func updateUI(response: HabitListResponse) {
        DispatchQueue.main.async {
            self.commentTextView.text = response.comment
            self.habits = response.habits
            self.reusableHabits = self.habits
            self.habitTableView.reloadData()
        }
    }
  }

extension HabitViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return reusableHabits?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(rgb: 0xf5f4f1)
        return headerView
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
        guard let cell = (self.habitTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? HabitListViewCell) else { return UITableViewCell() }
          
        // note that indexPath.section is used rather than indexPath.row
        let habit = (reusableHabits?[indexPath.section])!
        cell.nameLabel?.text = habit.title
        cell.descriptionLabel.text = habit.description
        cell.percentageLabel.text = "\(habit.percent)%"
        
        cell.backgroundColor = UIColor.clear
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.clear.cgColor
        cell.layer.cornerRadius = 12
        cell.clipsToBounds = true
        
        return cell
    }
      
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // note that indexPath.section is used rather than indexPath.row
        print("You tapped section number \(indexPath.section).")
        performSegue(withIdentifier: "showDetail", sender: indexPath.section)
    }
}

class HabitListViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
}
