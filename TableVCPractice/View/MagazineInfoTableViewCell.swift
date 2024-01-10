//
//  MagazineInfoTableViewCell.swift
//  TableVCPractice
//
//  Created by JinwooLee on 1/8/24.
//

import UIKit

protocol MagazineUIConfigure {
    func cellDesign()
}

class MagazineInfoTableViewCell: UITableViewCell, MagazineUIConfigure {

    
 //MARK: - IBOutler
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var dateTitle: UILabel!
 
    func cellDesign() {
        mainImageView.contentMode = .scaleAspectFill
        mainImageView.layer.cornerRadius = 15
        
        mainTitle.numberOfLines = 0
        mainTitle.font = UIFont(name:"HelveticaNeue-Bold", size: 25)
        
        subTitle.textColor = .lightGray
        subTitle.font = .boldSystemFont(ofSize: 16)
        
        dateTitle.textAlignment = .right
        dateTitle.font = .boldSystemFont(ofSize: 15)
        dateTitle.textColor = .lightGray
    }
    
}
