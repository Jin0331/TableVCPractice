//
//  TravelViewController.swift
//  TableVCPractice
//
//  Created by JinwooLee on 1/11/24.
//

import UIKit

class TravelViewController: UIViewController {
    
    static let storyboard = "Travel"
    static let identifier = "Travel"
    
    @IBOutlet weak var travelLabel: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        travelLabel.text = "관광지 화면"
        travelLabel.font = .boldSystemFont(ofSize: 25)
        navigationItem.title = "관광지 화면"
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItem?.title = nil
    }
}
