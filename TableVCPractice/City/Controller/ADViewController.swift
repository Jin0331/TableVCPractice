//
//  ADViewController.swift
//  TableVCPractice
//
//  Created by JinwooLee on 1/11/24.
//

import UIKit

class ADViewController: UIViewController {
    
    static let storyboard = "AD"
    static let identifier = "AD"

    @IBOutlet weak var adLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        adLabel.text = "광고 화면"
        adLabel.font = .boldSystemFont(ofSize: 35)
        
        configureNavigationBar()
        setBarButtonItem()
    }
    
}

extension ADViewController {
    func configureNavigationBar() {
        navigationItem.title = "광고 화면"
        navigationController?.navigationBar.tintColor = .black
        
    }
    
    func setBarButtonItem() {
        let leftImage = UIImage(systemName: "multiply")
        let leftButton =  UIBarButtonItem(image: leftImage, style: .plain, target: self, action: #selector(leftBarButtonItemClicked))
        navigationItem.leftBarButtonItem = leftButton
    }
    
    @objc func leftBarButtonItemClicked() {
        dismiss(animated: true)
    }
}
