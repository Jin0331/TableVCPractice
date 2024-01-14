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
extension TravelTalkViewController:setUIView {
    static var identifier: String = "TravelTalkViewController"
    static var storyboard: String = "TravelTalkViewController"
    
    func configureUIView() {
        chatTableView.delegate = self
        chatTableView.dataSource = self
        
        // 개인 채팅방 XIB
        let xib1 = UINib(nibName: TravelChatMainTableViewCell.identifier, bundle: nil)
        chatTableView.register(xib1, forCellReuseIdentifier: TravelChatMainTableViewCell.identifier)
    }
    
    func configureDesign() {
        navigationItem.title = "Travel Talk"
    }
    
    
}

// table view 관련
extension TravelTalkViewController : UITableViewDelegate, UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return mockChatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 여기서 cell 2개 받아야 됨
        // 우선 개인 채팅방부터 하고. 추후 구현
        let userCell = tableView.dequeueReusableCell(withIdentifier: TravelChatMainTableViewCell.identifier, for: indexPath) as! TravelChatMainTableViewCell
        
        print(mockChatList[indexPath.row])
        
        userCell.setDesignTableCell(cell: mockChatList[indexPath.row])
        
        
        return userCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let sb = UIStoryboard(name: TravelTalkChatViewController.storyboard, bundle: nil)
        let vc = sb.instantiateViewController(identifier: TravelTalkChatViewController.identifier)
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
