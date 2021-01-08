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
    private var resultHandler: ((Result<HabitDetailResponse, Error>)-> Void)!
    var habit: Habit?
    var detailHabit: HabitDetail?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showModification" {
            let vc = segue.destination as? ModificationViewController
            
            vc?.habit = self.habit
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultHandler = { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.updateUI(response: response)
            case .failure(let error):
                print("Error", error.localizedDescription)
            }
        }
        APIManager.shared.getHabit(habitId: habit!.habitId, year: 2020, month: 4, completionHandler: resultHandler)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showDetail" {
//
//        }
//    }
    
    private func updateUI(response: HabitDetailResponse) {
        DispatchQueue.main.async {
            self.nameLabel.text = response.habit.title
            self.descriptionLabel.text = response.habit.description
        }
    }
    
    
//    @IBAction func showModification(_ sender: Any) {
//        performSegue(withIdentifier: "showModification", sender: nil)
//    }
    
    @IBAction func closeController(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
