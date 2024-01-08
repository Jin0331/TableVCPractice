//
//  Case3TableViewController.swift
//  TableVCPractice
//
//  Created by JinwooLee on 1/7/24.
//

import UIKit

class Case3TableViewController: UITableViewController, UITextFieldDelegate {
       
    //MARK: - Controller IBOutlet
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var userButton: UIButton!
    
    var shopingList = ShopingList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "쇼핑"
        textField.placeholder = "무엇을 구매하실 건가요?"
        textField.layer.cornerRadius = 15
        userButton.layer.cornerRadius = 10
        
        // return key사용
        textField.delegate = self
        
        tableView.separatorInset = UIEdgeInsets(top: 1, left: 0, bottom: 1, right: 0)
    }
    
    //MARK: - Table View
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopingList.shoping.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Case3TableViewCell", for: indexPath) as! Case3TableViewCell
               
        cell.cellTextLabel.text = shopingList.shoping[indexPath.row].item
        cell.cellTextLabel.font = .boldSystemFont(ofSize: 11)
        
        // 3항 연산자를 이용해서 image set,, Boolean 값에 따라
        let leftImage = shopingList.shoping[indexPath.row].checkBox ? "checkmark.square.fill" : "checkmark.square"
        let rightImage = shopingList.shoping[indexPath.row].bookMark ? "star.fill" : "star"
        
        cell.leftButton.setImage(UIImage(systemName: leftImage), for: .normal)
        cell.rightButton.setImage(UIImage(systemName: rightImage), for: .normal)
        
        cell.leftButton.tintColor = .black
        cell.rightButton.tintColor = .black
        
        cell.leftButton.tag = indexPath.row
        cell.rightButton.tag = indexPath.row
        
        cell.leftButton.addTarget(self, action: #selector(leftButtonClicked), for: .touchUpInside)
        cell.rightButton.addTarget(self, action: #selector(rightButtonClicked), for: .touchUpInside)
        
        return cell
    }
    
    @objc func leftButtonClicked(_ sender : UIButton) {
        print("\(sender.tag) - 버튼이 클릭되었다")
        print(shopingList.shoping[sender.tag].item)
        
        shopingList.shoping[sender.tag].checkBox.toggle()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
        
    }
    
    @objc func rightButtonClicked(_ sender : UIButton) {
        print("\(sender.tag) - 버튼이 클릭되었다")
        print(shopingList.shoping[sender.tag].item)
        
        shopingList.shoping[sender.tag].bookMark.toggle()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
    }
    
//    //MARK: - IBAction
    @IBAction func addButton(_ sender: UIButton) {
        
        if textField.text != "" {
            shopingList.shoping.append(Shoping(item: textField.text!, checkBox: false, bookMark: false))
            
            tableView.reloadData() // Table View update!
        } else {
            print("공백들어옴")
        }
        
    }
    
    //MARK: -delegate function
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
       textField.resignFirstResponder()
        
        if textField.text != "" {
            shopingList.shoping.append(Shoping(item: textField.text!, checkBox: false, bookMark: false))
            
            tableView.reloadData() // Table View update!
        } else {
            print("공백들어옴")
        }
        
       return true
    }
    
}
