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
    static var identifier: String {
        <#code#>
    }
    
    static var storyboard: String {
        <#code#>
    }
    
    func configureUIView() {
        <#code#>
    }
    
    func configureDesign() {
        <#code#>
    }
    
    
}

extension TravelTalkChatViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
