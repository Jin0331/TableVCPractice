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

}

extension MagazineInfoTableViewController  {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magzineList.magazine.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // image
        let cell = tableView.dequeueReusableCell(withIdentifier: MagazineInfoTableViewCell.identifier, for: indexPath) as! MagazineInfoTableViewCell
        
        cell.selectionStyle = .none
        
        cell.cellDesign(cell : magzineList.magazine[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 450
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let sb = UIStoryboard(name: MagzineInfoViewController.identifier, bundle: nil)
        
        let vc = sb.instantiateViewController(withIdentifier: MagzineInfoViewController.identifier) as! MagzineInfoViewController
        
        vc.urlString = magzineList.magazine[indexPath.row].link
                
        navigationController?.pushViewController(vc, animated: true)
    }
}
