//
//  ModificationViewController.swift
//  HabitBread
//
//  Created by 염준우 on 2020/12/29.
//
import UIKit

class ModificationViewController: UIViewController {
    
    @IBOutlet weak var habitTitleEditText: UITextField!
    @IBOutlet weak var habitDescriptionEditText: UITextField!
    @IBOutlet weak var habitAlarmTimePicker: UIDatePicker!
    @IBOutlet weak var habitAlarmSwitch: UISwitch!
    var habitDays : [UIView] = []
    
    @IBOutlet weak var alarmStack: UIStackView!
    
    var habit: Habit?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        habitTitleEditText.text = habit?.title
        habitDescriptionEditText.text = habit?.description
    }

    @IBAction func switchValueChange(_ sender: Any) {
        if habitAlarmSwitch.isOn {
            habitAlarmTimePicker.isEnabled = true
        } else {
            habitAlarmSwitch.isEnabled = false
        }
    }
    
    @IBAction func OnDeleteHabit(_ sender: Any) {
        // send Server to Delete Habit
        // delete HabitViewModel to delete this Habit
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
