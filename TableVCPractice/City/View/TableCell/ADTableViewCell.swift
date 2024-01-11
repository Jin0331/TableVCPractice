//
//  ADTableViewCell.swift
//  TableVCPractice
//
//  Created by JinwooLee on 1/11/24.
//

import UIKit

class ADTableViewCell: UITableViewCell {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var adLabel: UILabel!
    
    static let identifier = "ADTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureCellDesign()
    }
}

extension ADTableViewCell {
    func configureCellDesign() {
        mainLabel.textAlignment = .center
        mainLabel.font = .boldSystemFont(ofSize: 25)
        mainLabel.numberOfLines = 0
        
        adLabel.textAlignment = .center
        adLabel.font = .systemFont(ofSize: 10)
    }
}
