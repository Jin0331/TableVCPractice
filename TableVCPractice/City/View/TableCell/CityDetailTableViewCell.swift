//
//  CityDetailTableViewCell.swift
//  TableVCPractice
//
//  Created by JinwooLee on 1/11/24.
//

import UIKit
import Cosmos

class CityDetailTableViewCell: UITableViewCell {

    static var identifier = "CityDetailTableViewCell"
    
    @IBOutlet weak var mainTextLabel : UILabel!
    @IBOutlet weak var subTextLabel : UILabel!
    @IBOutlet weak var mainImageView : UIImageView!
    @IBOutlet weak var subImageView : UIImageView!
    @IBOutlet weak var cosmosView: CosmosView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configTableCell()
    }
    
}

extension CityDetailTableViewCell {
    
    func configureImageIntoCell(cell : Travel) {
        
        // Image
        let url = URL(string: cell.travel_image ?? "")
        if let l = url {
            mainImageView.kf.setImage(with: l)
            
            // Label
            // Array의 Joined를 이용한 문자열 처리
            mainTextLabel.text = cell.title
            subTextLabel.text = cell.description
        }
    }
    
    func ratingComoView(cell : Travel) {
        // 구현 예정
    }
}


extension CityDetailTableViewCell {
    
    func configTableCell() {
        
        self.backgroundColor = .clear
        
        mainTextLabel.font = .boldSystemFont(ofSize: 15)
        subTextLabel.font = .systemFont(ofSize: 13)
        subTextLabel.textColor = .gray
        
        cosmosView.rating = 5
        mainImageView.clipsToBounds = true
        mainImageView.contentMode = .scaleAspectFit
        mainImageView.layer.cornerRadius = 10
        
        subImageView.clipsToBounds = true
        subImageView.image = UIImage(systemName: "heart")
        subImageView.backgroundColor = .clear
        
    }
    

}
