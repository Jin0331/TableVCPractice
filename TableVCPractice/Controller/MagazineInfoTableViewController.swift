//
//  MagazineInfoTableViewController.swift
//  TableVCPractice
//
//  Created by JinwooLee on 1/8/24.
//

import UIKit
import Kingfisher

class MagazineInfoTableViewController: UITableViewController {
    
    var magzineList = MagazineInfo()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none// 구분선 없애기

    }
//    
//    //MARK: - section
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//        
//    }
//    
    //MARK: - cell
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magzineList.magazine.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // image
        let cell = tableView.dequeueReusableCell(withIdentifier: "MagazineInfoTableViewCell", for: indexPath) as! MagazineInfoTableViewCell
        
        let url = URL(string: magzineList.magazine[indexPath.row].photo_image)
        if let l = url {
            cell.mainImageView.contentMode = .scaleAspectFill
            cell.mainImageView.layer.cornerRadius = 15
            cell.mainImageView.kf.setImage(with: l)
        }
        
        // main label
        cell.mainTitle.numberOfLines = 0
        cell.mainTitle.font = UIFont(name:"HelveticaNeue-Bold", size: 25)
        cell.mainTitle.text = magzineList.magazine[indexPath.row].title
        
        // sub label
        cell.subTitle.text = magzineList.magazine[indexPath.row].subtitle
        cell.subTitle.textColor = .lightGray
        cell.subTitle.font = .boldSystemFont(ofSize: 16)
        
        // date label
        cell.dateTitle.textAlignment = .right
        cell.dateTitle.font = .boldSystemFont(ofSize: 15)
        cell.dateTitle.textColor = .lightGray

        if let date = stringToDate(magzineList.magazine[indexPath.row].date) {
            cell.dateTitle.text = date
        } else {
            cell.dateTitle.text = ""
        }
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 450
    }

}
