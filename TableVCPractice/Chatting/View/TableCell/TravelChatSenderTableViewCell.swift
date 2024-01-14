//
//  TravelChatSenderTableViewCell.swift
//  TableVCPractice
//
//  Created by JinwooLee on 1/12/24.
//

import UIKit

class TravelChatSenderTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
}

extension TravelChatSenderTableViewCell : setTableViewCell {
    
    static var identifier: String {
        return "TravelChatReceiverTableViewCell"
    }
    func setDesignTableCell(cell: ChatRoom) {
        
    }
    

}
