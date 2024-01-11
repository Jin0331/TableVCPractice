//
//  CityInfoCollectionViewCell.swift
//  TableVCPractice
//
//  Created by JinwooLee on 1/9/24.
//

import UIKit
import Kingfisher

protocol CityInfoCellConfigure {
    func defaultCellConfigure()
}

class CityInfoCollectionViewCell: UICollectionViewCell, CityInfoCellConfigure {

    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    // 공통적인 부분에 대한 설정. 코드 경량화를 위한 부분. class 아님
    override func awakeFromNib() {
        defaultCellConfigure()
        
    }
    
    func defaultCellConfigure() {
        cellImageView.contentMode = .scaleAspectFill
        
        DispatchQueue.main.async {
            self.cellImageView.layer.cornerRadius = self.cellImageView.frame.width / 2
            self.cellImageView.clipsToBounds = true
        }
        
        mainTitleLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 15)
        mainTitleLabel.textAlignment = .center
        mainTitleLabel.textColor = .black
        
        subTitleLabel.textAlignment = .center
        subTitleLabel.font = .boldSystemFont(ofSize: 10)
        subTitleLabel.textColor = .lightGray
        subTitleLabel.numberOfLines = 0
    }
    
}

extension CityInfoCollectionViewCell {
    
    func configureImageIntoCell(cell : City) {
        
        // Image
        let url = URL(string: cell.city_image)
        if let l = url {
            cellImageView.kf.setImage(with: l)
            
            // Label
            // Array의 Joined를 이용한 문자열 처리
            mainTitleLabel.text = [cell.city_name, cell.city_english_name].joined(separator: " | ")
            subTitleLabel.text = cell.city_explain
        }
    }
}
