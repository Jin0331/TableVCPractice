//
//  Case3TableViewController.swift
//  TableVCPractice
//
//  Created by JinwooLee on 1/7/24.
//

import UIKit

class Case3TableViewController: UITableViewController, UITextFieldDelegate {
    
    //MARK: - tableView DataSource
    var dataList : [String] = ["그립톡 구매하기", "사이다 구매", "아이패드 케이스 최저가 알아보기", "양말"]
    
    //MARK: - Controller IBOutlet
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var userButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "쇼핑"
        textField.placeholder = "무엇을 구매하실 건가요?"
        textField.layer.cornerRadius = 15
        userButton.layer.cornerRadius = 10
        
        // return key사용
        textField.delegate = self
        
    }
    
    //MARK: - Table View
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Case3TableViewCell", for: indexPath) as! Case3TableViewCell
        
        cell.cellLabel.text = dataList[indexPath.row]
        // left image
        cell.cellImageView.image = [UIImage(systemName: "checkmark.square"), UIImage(systemName: "checkmark.square.fill")].randomElement()!
        cell.cellImageView.tintColor = .black
        
        // right image
        cell.cellImageView2.image = [UIImage(systemName: "star"), UIImage(systemName: "star.fill")].randomElement()!
        cell.cellImageView2.tintColor = .black

        
        return cell
    }
    
    //MARK: - IBAction
    @IBAction func addButton(_ sender: UIButton) {
        
        if textField.text != "" {
            dataList.append(textField.text!)
            print(dataList)
            
            tableView.reloadData() // Table View update!
        } else {
            print("공백들어옴")
        }
        
    }
    
    //MARK: -delegate function
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
       textField.resignFirstResponder()
        
        if textField.text != "" {
            dataList.append(textField.text!)
            print(dataList)
            
            tableView.reloadData() // Table View update!
        } else {
            print("공백들어옴")
        }
        
       return true
    }
    
}
