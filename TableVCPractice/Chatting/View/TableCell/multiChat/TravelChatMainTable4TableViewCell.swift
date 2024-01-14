//
//  TravelChatMainTable4TableViewCell.swift
//  TableVCPractice
//
//  Created by JinwooLee on 1/15/24.
//

import UIKit

class TravelChatMainTable4TableViewCell: UITableViewCell {

    @IBOutlet var profileImage: [UIImageView]!
    @IBOutlet var chatRoomNameLabel: UILabel!
    @IBOutlet var latestLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

extension TravelChatMainTable4TableViewCell : setTableViewCell {
    static var identifier: String {
        return "TravelChatMainTable4TableViewCell"
    }
    
    func setDesignTableCell(cell : ChatRoom) {
        for index in 0...3 {
            profileImage[index].image = UIImage(named: cell.chatroomImage[index])
            profileImage[index].contentMode = .scaleAspectFit
            DispatchQueue.main.async {
                self.profileImage[index].clipsToBounds = true
                self.profileImage[index].layer.cornerRadius = self.profileImage[index].frame.width / 2
            }
        }
        
        chatRoomNameLabel.text = cell.chatroomName
        chatRoomNameLabel.font = .boldSystemFont(ofSize: 15)
        chatRoomNameLabel.textAlignment = .left
        
        latestLabel.text = cell.chatList[cell.chatList.count-1].message
        latestLabel.font = .boldSystemFont(ofSize: 13)
        latestLabel.textColor = .lightGray
        latestLabel.textAlignment = .left
        latestLabel.numberOfLines = 0

        
        dateLabel.text = DateConvert(dateStr: cell.chatList[cell.chatList.count-1].date, index:dateSelector.main.index)!
        dateLabel.font = .boldSystemFont(ofSize: 13)
        dateLabel.textColor = .lightGray
        dateLabel.textAlignment = .left
        
    }
}
