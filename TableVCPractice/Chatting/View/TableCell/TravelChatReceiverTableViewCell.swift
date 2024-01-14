//
//  TravelChatReceiverTableViewCell.swift
//  TableVCPractice
//
//  Created by JinwooLee on 1/12/24.
//

import UIKit

class TravelChatReceiverTableViewCell: UITableViewCell {

    @IBOutlet var chatLabel: UILabel!
    @IBOutlet var chatDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}

extension TravelChatReceiverTableViewCell : setTableViewCell {
    
    static var identifier: String {
        return "TravelChatReceiverTableViewCell"
    }
    
    func setDesignTableCell(cell: Chat) {
        
        chatLabel.text = cell.message
        chatLabel.font = .systemFont(ofSize: 17)
        chatLabel.layer.cornerRadius = 10
        chatLabel.layer.borderWidth = 1
        chatLabel.layer.borderColor = UIColor.lightGray.cgColor
        
        chatDate.text = DateConvert(dateStr: cell.date, index: dateSelector.chat.index)
        chatDate.font = .systemFont(ofSize: 12)
        chatDate.textColor = .lightGray
        chatDate.textAlignment = .left
    }
}
