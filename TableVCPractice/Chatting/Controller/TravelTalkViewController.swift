//
//  TravelTalkViewController.swift
//  TableVCPractice
//
//  Created by JinwooLee on 1/12/24.
//

import UIKit

class TravelTalkViewController: UIViewController {

    @IBOutlet var chatSearchBar: UIView!
    @IBOutlet var chatTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

//MARK: - extension
extension TravelTalkViewController:setUIView {
    static var identifier: String {
        <#code#>
    }
    
    static var storyboard: String {
        <#code#>
    }
    
    func configureUIView() {
        chatTableView.delegate = self
        chatTableView.dataSource = self
    }
    
    func configureDesign() {
        <#code#>
    }
    
    
}

// table view 관련
extension TravelTalkViewController : UITableViewDelegate, UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 여기서 cell 2개 받아야 됨
        // 우선 개인 채팅방부터 하고. 추후 구현
        let userCell = tableView.dequeueReusableCell(withIdentifier: TravelChatMainTableViewCell.identifier, for: indexPath) as! TravelChatMainTableViewCell
        
        
        return userCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let sb = UIStoryboard(name: TravelTalkChat, bundle: nil)
    }
}
