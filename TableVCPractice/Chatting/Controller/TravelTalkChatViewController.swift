//
//  TravelTalkChatViewController.swift
//  TableVCPractice
//
//  Created by JinwooLee on 1/12/24.
//

import UIKit

class TravelTalkChatViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension TravelTalkChatViewController : setUIView {
    static var identifier: String = "TravelTalkChat"
    static var storyboard: String = "TravelTalkChat"
    
    func configureUIView() {
        
    }
    
    func configureDesign() {
        
    }
    
    
}

extension TravelTalkChatViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let chatCell = tableView.dequeueReusableCell(withIdentifier: TravelTalkChatViewController.identifier, for: indexPath)
        
        return chatCell
    }
}
