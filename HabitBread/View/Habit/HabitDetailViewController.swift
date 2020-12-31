//
//  HabitDetailViewController.swift
//  HabitBread
//
//  Created by 염준우 on 2020/12/28.
//
import UIKit

class HabitDetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var name: String?
    var habitDescription: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI() {
        if let name = self.name, let description = self.habitDescription {
            nameLabel.text = name
            descriptionLabel.text = description
        }
    }
    @IBAction func closeController(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
