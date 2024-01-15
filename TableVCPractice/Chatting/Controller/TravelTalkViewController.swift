//
//  TravelTalkViewController.swift
//  TableVCPractice
//
//  Created by JinwooLee on 1/12/24.
//

import UIKit

class TravelTalkViewController: UIViewController {

    //MARK: - IBOutlet, variable
    @IBOutlet var chatSearchBar: UIView!
    @IBOutlet var chatTableView: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUIView()
        configureDesign()
    }
}

//MARK: - extension
extension TravelTalkViewController  {
        
    func configureUIView() {
        chatTableView.delegate = self
        chatTableView.dataSource = self
        
        // 개인 채팅방 XIB
        let xib1 = UINib(nibName: TravelChatMainTableViewCell.identifier, bundle: nil)
        chatTableView.register(xib1, forCellReuseIdentifier: TravelChatMainTableViewCell.identifier)
        
        // 단톡방 채팅방 XIB
        let xib2 = UINib(nibName: TravelChatMainTable4TableViewCell.identifier, bundle: nil)
        chatTableView.register(xib2, forCellReuseIdentifier: TravelChatMainTable4TableViewCell.identifier)
    }
    
    func configureDesign() {
        navigationItem.title = "TRAVEL TALK"
        chatTableView.separatorStyle = .none
    }
    
    
}

// table view 관련
extension TravelTalkViewController : UITableViewDelegate, UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return mockChatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 여기서 cell 2개 받아야 됨
        // 우선 개인 채팅방부터 하고. 추후
//        let userCell = tableView.dequeueReusableCell(withIdentifier: TravelChatMainTableViewCell.identifier, for: indexPath) as! TravelChatMainTableViewCell
//        
//        let multiUserCell = tableView.dequeueReusableCell(withIdentifier: TravelChatMainTable4TableViewCell.identifier, for: indexPath) as! TravelChatMainTable4TableViewCell
        
        
        if mockChatList[indexPath.row].chatroomImage.count == 1 {
            let userCell = tableView.dequeueReusableCell(withIdentifier: TravelChatMainTableViewCell.identifier, for: indexPath) as! TravelChatMainTableViewCell

            userCell.selectionStyle = .none
            userCell.setDesignTableCell(cell: mockChatList[indexPath.row])
            
            return userCell
            
        } else {

            
            let multiUserCell = tableView.dequeueReusableCell(withIdentifier: TravelChatMainTable4TableViewCell.identifier, for: indexPath) as! TravelChatMainTable4TableViewCell
            
            multiUserCell.selectionStyle = .none
            multiUserCell.setDesignTableCell(cell: mockChatList[indexPath.row])
//
            return multiUserCell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(TravelTalkChatViewController.identifier)
        
        let sb = UIStoryboard(name: TravelTalkChatViewController.identifier, bundle: nil)
        let vc = sb.instantiateViewController(identifier: TravelTalkChatViewController.identifier) as! TravelTalkChatViewController
        
        // 데이터 전달
        vc.storedData = mockChatList[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

