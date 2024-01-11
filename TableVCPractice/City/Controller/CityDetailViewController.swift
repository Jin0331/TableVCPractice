//
//  CityDetailViewController.swift
//  TableVCPractice
//
//  Created by JinwooLee on 1/11/24.
//

import UIKit

class CityDetailViewController: UIViewController {

    static let identifier = "CityDetailViewController" // Controller ID
    static let stroyboard = "CityDetail" // storyBoard ID
    let cityDetail = TravelInfo()
    
    @IBOutlet weak var detailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "도시 상세 정보"
        
        configureTableView()
    }

}

//MARK: - Extension
extension CityDetailViewController : UITableViewDelegate, UITableViewDataSource {
    
    func configureTableView() {
    
//        detailTableView.backgroundColor = .clear
        
        detailTableView.delegate = self
        detailTableView.dataSource = self
        
        let xib1 = UINib(nibName: CityDetailTableViewCell.identifier, bundle: nil)
        detailTableView.register(xib1, forCellReuseIdentifier: CityDetailTableViewCell.identifier)
        
        let xib2 = UINib(nibName: ADTableViewCell.identifier, bundle: nil)
        detailTableView.register(xib2, forCellReuseIdentifier: ADTableViewCell.identifier)
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let travel = cityDetail.travel[indexPath.row]
        
        if !travel.ad {
            return 150
        } else {
            return 110
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityDetail.travel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let travel = cityDetail.travel[indexPath.row]
        
        if !travel.ad {
            let cell = tableView.dequeueReusableCell(withIdentifier: CityDetailTableViewCell.identifier, for: indexPath) as! CityDetailTableViewCell
            
            cell.configureImageIntoCell(cell: cityDetail.travel[indexPath.row])
            
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ADTableViewCell.identifier, for: indexPath) as! ADTableViewCell
            
            cell.configureTextIntoCell(cell: travel)
            
            return cell
        }
    }
    
    
}
