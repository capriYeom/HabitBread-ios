//
//  HabitDetailViewController.swift
//  HabitBread
//
//  Created by 염준우 on 2020/12/28.
//
import UIKit

class HabitDetailViewController: UIViewController {
    
    // Model
    // 랭킹
    
    // View
    // - nameLabel, Description라벨
    // - listCell 에 필요한 정보를 ViewModel한테 받아온다
    // > listCell은 viewModel로부터 받은 정보로 ViewUpdate를 한다.
    
    // ViewModel
    // - DetailViewModel 만들고, 뷰 레이어에서 필요한 메서드 만들기
    // 모델을 가지고 있어야 함 .. Habit디테일로 떨어지는 값
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var habit: Habit?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loaded \(habit?.title)")
        updateUI()
    }
    
    private func updateUI() {
        if let habit = self.habit {
            nameLabel.text = habit.title
            descriptionLabel.text = habit.description
        }
    }
    @IBAction func closeController(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
