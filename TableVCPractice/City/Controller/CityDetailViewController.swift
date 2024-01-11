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
    }

}

//MARK: - Extension
extension CityDetailViewController : UITableViewDelegate, UITableViewDataSource {
    
    func configureTableView() {
    
        detailTableView.backgroundColor = .clear
        
        detailTableView.delegate = self
        detailTableView.dataSource = self
        
        let xib1 = UINib(nibName: CityDetailTableViewCell.identifier, bundle: nil)
        detailTableView.register(xib1, forCellReuseIdentifier: CityDetailTableViewCell.identifier)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityDetail.travel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let city = cityDetail.travel[indexPath.row]
        
        if !city.ad {
            let cell = tableView.dequeueReusableCell(withIdentifier: CityDetailTableViewCell.identifier, for: indexPath) as! CityDetailTableViewCell //스토리보드와 연결하면서 해당 클래스의 변수 기능을 쓰는 것, 인스턴스를 생성하는 것!
            
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ADTableViewCell.identifier, for: indexPath) as! ADTableViewCell //스토리보드와 연결하면서 해당 클래스의 변수 기능을 쓰는 것, 인스턴스를 생성하는 것!
            
            return cell
        }
    }
    
    
}
