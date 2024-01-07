//
//  Case2TableViewController.swift
//  TableVCPractice
//
//  Created by JinwooLee on 1/7/24.
//

import UIKit

class Case2TableViewController: UITableViewController {

    let headerList : [String] = ["전체 설정", "개인 설정", "기타"]
    let dataList : [[String]] = [["공지사항", "실험실", "버전 정보"], 
    ["개인/보안", "알림", "채팅", "멀티프로필"], ["고객센터/도움말"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return headerList.count

    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return headerList[section]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return dataList[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Case2TableViewCell", for: indexPath)

        cell.textLabel?.text = dataList[indexPath.section][indexPath.row]
        
        return cell
    }

}
