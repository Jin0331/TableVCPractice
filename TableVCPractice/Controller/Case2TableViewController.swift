//
//  Case2TableViewController.swift
//  TableVCPractice
//
//  Created by JinwooLee on 1/7/24.
//

import UIKit

class Case2TableViewController: UITableViewController {

    var settingList = SettingList()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return settingList.list.count

    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return settingList.list[section].headerList
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return settingList.list[section].dataList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Case2TableViewCell", for: indexPath)

        cell.textLabel?.text = settingList.list[indexPath.section].dataList[indexPath.row]
                
        return cell
    }

}
