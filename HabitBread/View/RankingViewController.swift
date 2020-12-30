//
//  RankingViewController.swift
//  HabitBread
//
//  Created by 염준우 on 2020/12/30.
//

import UIKit

class RankingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var users: [RankUser] = [RankUser(userId: 1, userName: "User", exp: 3, achievement: 0, rank: "3")]
    
    let cellReuseIdentifier = "rankingCell"
    let cellSpacingHeight: CGFloat = 5
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = (self.rankingTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? UserTableViewCell) else { return UITableViewCell() }
          
        // note that indexPath.section is used rather than indexPath.row
        cell.rankLabel?.text = self.users[indexPath.section].userName
        cell.expLabel.text = "\(self.users[indexPath.section].exp)"
        cell.rankNumlabel.text = "\((indexPath.section)+1)"
        
        cell.backgroundColor = UIColor.white
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor(rgb: 0xF5F4F1).cgColor
        cell.layer.cornerRadius = 12
        cell.clipsToBounds = true
        
        return cell
    }
    
    @IBOutlet weak var rankingTableView: UITableView!
    @IBOutlet weak var myPercentageLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    
    private var handler: ((Result<Rank, Error>) -> Void)!
      
    override func viewDidLoad() {
        super.viewDidLoad()
        handler = { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let rank):
                self.updateUI(rank: rank)
            case .failure(let error):
                print("Error", error.localizedDescription)
            }
        }
        APIManager.shared.getRankings(completionHandler: handler)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
      
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // note that indexPath.section is used rather than indexPath.row
        print("You tapped cell number \(indexPath.section).")
    }
    
    func updateUI(rank: Rank) {
        rankLabel.text = "당신은 \(rank.userTotalCount)명 중에\(Int(rank.user.rank)!)등입니다."
        
//        let percent: floor(it.user.rank.toDouble()/it.userTotalCount*100).toInt()
        print("userRank: \(Double(rank.userTotalCount)/Double(rank.user.rank)!)" )
        let percent = 32
        myPercentageLabel.text = "\(percent)%"
    }
}

class UserTableViewCell: UITableViewCell{
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var rankNumlabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var expLabel: UILabel!
}

