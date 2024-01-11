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
        mainLabel.font = .boldSystemFont(ofSize: 17)
        mainLabel.numberOfLines = 0
        mainLabel.clipsToBounds = true
        mainLabel.layer.cornerRadius = 15
        mainLabel.backgroundColor = UIColor(red: .random(in: 0...1),
                                            green: .random(in: 0...1),
                                            blue: .random(in: 0...1),
                                            alpha: 0.8)
        adLabel.textAlignment = .center
        adLabel.font = .systemFont(ofSize: 15)
        adLabel.backgroundColor = .white
        adLabel.clipsToBounds = true
        adLabel.layer.cornerRadius = 5
    }
}

extension ADTableViewCell {
    func configureTextIntoCell(cell : Travel) {
        
        mainLabel.text = cell.title
        
    }
}
