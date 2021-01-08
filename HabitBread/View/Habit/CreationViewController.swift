//
//  CreationViewController.swift
//  HabitBread
//
//  Created by 염준우 on 2020/12/29.
//

import UIKit

class CreationViewController: UIViewController {
    
    @IBOutlet weak var habitNameEditText: UITextField!
    @IBOutlet weak var habitDescriptionEditText: UITextField!
    @IBOutlet weak var habitAlarmSwitch: UISwitch!
    @IBOutlet weak var habitAlarmPicker: UIDatePicker!
    
    @IBAction func switchAlarm(_ sender: Any) {
        if habitAlarmSwitch.isOn {
            habitAlarmPicker.isEnabled = true
        } else {
            habitAlarmPicker.isEnabled = false
        }
    }
    
    @IBAction func cancelCreation(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
