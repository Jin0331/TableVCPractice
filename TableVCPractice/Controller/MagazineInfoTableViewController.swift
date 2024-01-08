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

    }
    
    //MARK: - section
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
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
        cell.mainTitle.text = magzineList.magazine[indexPath.row].title
        
        // sub label
        cell.subTitle.text = magzineList.magazine[indexPath.row].subtitle
        
        // date label
        cell.dateTitle.text = magzineList.magazine[indexPath.row].date
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 450
    }

}
