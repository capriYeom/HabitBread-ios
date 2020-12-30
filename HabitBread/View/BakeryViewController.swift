//
//  BakeryViewController.swift
//  HabitBread
//
//  Created by 염준우 on 2020/12/30.
//

import UIKit

class BakeryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var bakeryCollectionView: UICollectionView!
    let bread = [[Bread(itemId: 1, ImageView: "", Name: "식빵"), Bread(itemId: 2, ImageView: "", Name: "토스트"), Bread(itemId: 1, ImageView: "", Name: "호빵"),Bread(itemId: 4, ImageView: "", Name: "잉어빵"), Bread(itemId: 5, ImageView: "", Name: "바게뜨")], [Bread(itemId: 6, ImageView: "", Name: "초코 도넛"), Bread(itemId: 7, ImageView: "", Name: "팬케이크"), Bread(itemId: 8, ImageView: "", Name: "앙버터"), Bread(itemId: 9, ImageView: "", Name: "크루아상"), Bread(itemId: 10, ImageView: "", Name: "프레첼"), Bread(itemId: 11, ImageView: "", Name: "홍또우빙")],[Bread(itemId: 12, ImageView: "", Name: "밀푀유"), Bread(itemId: 13, ImageView: "", Name: "크레페"), Bread(itemId: 14, ImageView: "", Name: "에끌레르"), Bread(itemId: 15, ImageView: "", Name: "마카롱")], [Bread(itemId: 16, ImageView: "", Name: "뜨르들로"), Bread(itemId: 17, ImageView: "", Name: "까눌레")]]
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return bread.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bread[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
//        guard let cell = (self.rankingTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? UserTableViewCell) else { return UITableViewCell() }
//
//        // note that indexPath.section is used rather than indexPath.row
//        cell.rankLabel?.text = self.users[indexPath.section].userName
//        cell.expLabel.text = "\(self.users[indexPath.section].userExp)"
//        cell.rankNumlabel.text = "\((indexPath.section)+1)"
//
//        cell.backgroundColor = UIColor.white
//        cell.layer.borderWidth = 1
//        cell.layer.borderColor = UIColor.black.cgColor
//        cell.layer.cornerRadius = 12
//        cell.clipsToBounds = true
//
//        return cell
        
        guard let cell = (self.bakeryCollectionView.dequeueReusableCell(withReuseIdentifier: "bakeryCell", for: indexPath) as? BreadViewCell) else { return UICollectionViewCell() }
        
        cell.levelLabel.text = "LV\((indexPath.section)+1)"
        cell.breadNameLabel.text = bread[indexPath.section][indexPath.row].Name
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.bounds.width - 8)/3
        let height: CGFloat = width * (10/7)
        return CGSize(width: width, height: height)
    }
}

class BreadViewCell: UICollectionViewCell {
    
    @IBOutlet weak var levelView: UIView!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var breadImageView: UIImageView?
    @IBOutlet weak var breadNameLabel: UILabel!
}

struct Bread {
    let itemId: Int
    let ImageView: String?
    let Name: String
}


