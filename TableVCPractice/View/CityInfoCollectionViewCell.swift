//
//  CityInfoCollectionViewCell.swift
//  TableVCPractice
//
//  Created by JinwooLee on 1/9/24.
//

import UIKit
import Kingfisher

class CityInfoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    // 공통적인 부분에 대한 설정. 코드 경량화를 위한 부분. class 아님
    override func awakeFromNib() {
        cellImageView.contentMode = .scaleAspectFill
        cellImageView.layer.cornerRadius = cellImageView.frame.height/2
        cellImageView.clipsToBounds = true
        
        mainTitleLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 15)
        mainTitleLabel.textAlignment = .center
        mainTitleLabel.textColor = .black
        
        subTitleLabel.textAlignment = .center
        subTitleLabel.font = .boldSystemFont(ofSize: 10)
        subTitleLabel.textColor = .lightGray
        subTitleLabel.numberOfLines = 0
        
    }
    
    func configureCell(cell : City) {
        
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
    
    // static으로 처리하면, 다른 class에서도 사용할 수 있음.
    static func configureCellLayout () -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        
        let spacing : CGFloat = 15
        let cellWidth = UIScreen.main.bounds.width - (spacing * 3)
        
        layout.itemSize = CGSize(width: cellWidth / 2, height: (cellWidth+60) / 2) // 셀의 크기
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
//        layout.minimumLineSpacing = 10
//        layout.minimumInteritemSpacing = 5
        layout.scrollDirection = .vertical
        
        return layout
    }
}
