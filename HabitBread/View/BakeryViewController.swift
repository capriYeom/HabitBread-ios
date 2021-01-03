//
//  BakeryViewController.swift
//  HabitBread
//
//  Created by 염준우 on 2020/12/30.
//

import UIKit

class BakeryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var bakeryCollectionView: UICollectionView!
    var bread = [BreadData().level1, BreadData().level2, BreadData().level3, BreadData().level4]

    private var handler: ((Result<[BreadResponse], Error>) -> Void)!
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return bread.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bread[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = (self.bakeryCollectionView.dequeueReusableCell(withReuseIdentifier: "bakeryCell", for: indexPath) as? BreadViewCell) else { return UICollectionViewCell() }
        
        let currentBread = bread[indexPath.section][indexPath.row]
        switch indexPath.section {
        case 1:
            cell.levelView.backgroundColor = UIColor.green
        case 2:
            cell.levelView.backgroundColor = UIColor.orange
        case 3:
            cell.levelView.backgroundColor = UIColor.systemPink
        default:
            cell.levelView.backgroundColor = UIColor.brown
        }
        cell.levelLabel.text = "LV\((indexPath.section)+1)"
        cell.breadNameLabel.text = currentBread.name
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.bounds.width - 8)/2
        let height: CGFloat = width * (10/7)
        return CGSize(width: width, height: height)
    }
    
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
        APIManager.shared.getItem(completionHandler: handler)
    }
    
    private func updateUI(response: [BreadResponse]) {
        DispatchQueue.main.async {
            for userItem in response {
                for row in self.bread {
                    for var column in row {
                        if column.itemId == userItem.item.itemId {
                            column = userItem.item
                        }
                    }
                }
            }
            self.bakeryCollectionView.reloadData()
        }
    }
}

class BreadViewCell: UICollectionViewCell {
    
    @IBOutlet weak var levelView: UIView!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var breadImageView: UIImageView?
    @IBOutlet weak var breadNameLabel: UILabel!
}
