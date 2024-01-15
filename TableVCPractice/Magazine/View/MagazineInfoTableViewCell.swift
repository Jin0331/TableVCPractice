//
//  MagazineInfoTableViewCell.swift
//  TableVCPractice
//
//  Created by JinwooLee on 1/8/24.
//

import UIKit

class MagazineInfoTableViewCell: UITableViewCell {
    
    
    //MARK: - IBOutler
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var dateTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}

extension MagazineInfoTableViewCell {
    func cellDesign(cell : Magazine) {
        
        // set UI
        let url = URL(string: cell.photo_image)!
        mainImageView.kf.setImage(with: url)
        
        // main label
        mainTitle.text = cell.title
        
        //sub label
        subTitle.text = cell.subtitle
        
        //date
        if let date = cell.newDate {
            dateTitle.text = date
        } else {
            dateTitle.text = ""
        }
        
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
