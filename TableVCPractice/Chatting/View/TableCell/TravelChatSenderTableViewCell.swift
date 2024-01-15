//
//  TravelChatSenderTableViewCell.swift
//  TableVCPractice
//
//  Created by JinwooLee on 1/12/24.
//

import UIKit

class TravelChatSenderTableViewCell: UITableViewCell {

    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nickNameLabel: UILabel!
    @IBOutlet var chatLabel: UILabel!
    @IBOutlet var chatDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
}

extension TravelChatSenderTableViewCell {
    
    func setDesignTableCell(cell: Chat) {
        // image
        profileImageView.image = UIImage(named: cell.user.profileImage)
        profileImageView.contentMode = .scaleAspectFit
        DispatchQueue.main.async {
            self.profileImageView.clipsToBounds = true
            self.profileImageView.layer.cornerRadius = self.profileImageView.frame.width / 2
        }
        
        //label
        nickNameLabel.text = cell.user.profileImage
        nickNameLabel.font = .boldSystemFont(ofSize: 17)
        nickNameLabel.textAlignment = .left
        
        chatLabel.text = cell.message
        chatLabel.font = .systemFont(ofSize: 17)
        chatLabel.layer.cornerRadius = 5
        chatLabel.layer.borderColor = UIColor.lightGray.cgColor
        chatLabel.layer.borderWidth = 0.7
        
        chatDate.text = DateConvert(dateStr: cell.date, index: dateSelector.chat.index)
        chatDate.font = .systemFont(ofSize: 12)
        chatDate.textColor = .lightGray
        chatDate.textAlignment = .left
    }
    

}
