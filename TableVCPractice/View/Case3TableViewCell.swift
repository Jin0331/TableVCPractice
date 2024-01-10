//
//  Case3TableViewCell.swift
//  TableVCPractice
//
//  Created by JinwooLee on 1/7/24.
//

import UIKit

protocol Case3UiConfigure {
    func setCellDesign()
}

class Case3TableViewCell: UITableViewCell, Case3UiConfigure{
    
    @IBOutlet weak var backgroundLabel: UILabel!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var cellTextLabel: UILabel!
    
    func setCellDesign() {
        cellTextLabel.font = .boldSystemFont(ofSize: 11)
        leftButton.tintColor = .black
        rightButton.tintColor = .black

    }
}
