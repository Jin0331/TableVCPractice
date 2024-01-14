//
//  TravelChatMainTableViewCell.swift
//  TableVCPractice
//
//  Created by JinwooLee on 1/12/24.
//

import UIKit

class TravelChatMainTableViewCell: UITableViewCell {
    
    @IBOutlet var chatImage: UIImageView!
    @IBOutlet var chatNickname: UILabel!
    @IBOutlet var chatLatestText: UILabel!
    @IBOutlet var chatLatestDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}

extension TravelChatMainTableViewCell : setTableViewCell {
    
    static var identifier: String {
        return "TravelChatMainTableViewCell"
    }
    
    func setDesignTableCell(cell : ChatRoom) {
        //image
        chatImage.image = UIImage(named: cell.chatroomImage[0])
        chatImage.clipsToBounds = true
        chatImage.layer.cornerRadius = self.chatImage.frame.width / 2
    
        // label
        chatNickname.text = cell.chatroomName
        chatNickname.font = .boldSystemFont(ofSize: 15)
        chatNickname.textAlignment = .left
        
        chatLatestText.text = cell.chatList[0].message
        chatLatestText.font = .boldSystemFont(ofSize: 13)
        chatLatestText.textColor = .lightGray
        chatLatestText.textAlignment = .left
        
        chatLatestDate.text = cell.chatList[0].date
        chatLatestDate.font = .boldSystemFont(ofSize: 13)
        chatLatestDate.textColor = .lightGray
        chatLatestDate.textAlignment = .left
        
    }
    
    
}
