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

    //MARK: - cell
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magzineList.magazine.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // image
        let cell = tableView.dequeueReusableCell(withIdentifier: "MagazineInfoTableViewCell", for: indexPath) as! MagazineInfoTableViewCell
        
        cell.cellDesign()
        
        let url = URL(string: magzineList.magazine[indexPath.row].photo_image)!
        cell.mainImageView.kf.setImage(with: url)
        
        // main label
        cell.mainTitle.text = magzineList.magazine[indexPath.row].title
        
        // sub label
        cell.subTitle.text = magzineList.magazine[indexPath.row].subtitle

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

extension MagazineInfoTableViewController {
    //MARK: - function
    func stringToDate(_ string : String) -> String? {

        let str = Array(string)
        var strChange : [String] = []
        for (index, value) in str.enumerated() {
            print(value)
            strChange.append(String(value))
            if index % 2 != 0 && index != str.count - 1{
                strChange.append("-")
            }
        }

        // string to date... 이게 맞는지 모르겠다 일단 결과는 나옴
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy-MM-dd"
        let convertDate = dateFormatter.date(from: strChange.joined(separator: ""))

        let korDateFormatter = DateFormatter()
        korDateFormatter.dateFormat = "yy년 M월 d일"
        korDateFormatter.locale = Locale(identifier:"ko_KR")

        return korDateFormatter.string(from: convertDate!)
    }

}
