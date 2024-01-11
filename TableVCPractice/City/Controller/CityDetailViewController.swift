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
        navigationController?.navigationBar.tintColor = .black
        
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
}

extension CityDetailViewController {
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
            cell.ratingComoView(cell: cityDetail.travel[indexPath.row]) // cosmo를 이용한 별찍기
            
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ADTableViewCell.identifier, for: indexPath) as! ADTableViewCell
            
            cell.configureTextIntoCell(cell: travel)
            
            return cell
        }
        
    }
    
    //조건에 따른 다른 Story 띄우기
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let travel = cityDetail.travel[indexPath.row]
        
        if travel.ad {
            let sb = UIStoryboard(name: ADViewController.storyboard, bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: ADViewController.identifier) as! ADViewController
            
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            
            present(nav, animated: true)
        } else {
            let sb = UIStoryboard(name: TravelViewController.storyboard, bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: TravelViewController.identifier) as! TravelViewController
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let like = UIContextualAction(style: .normal, title: "Like") { (UIContextualAction, UIView, success: @escaping (Bool) -> Void) in
            print("Like 클릭 됨")
            success(true)
        }
        like.backgroundColor = .systemPink
        
        
        let share = UIContextualAction(style: .normal, title: "Share") { (UIContextualAction, UIView, success: @escaping (Bool) -> Void) in
            print("Share 클릭 됨")
            success(true)
        }
        share.backgroundColor = .systemTeal
        
        //actions배열 인덱스 0이 왼쪽에 붙어서 나옴
        return UISwipeActionsConfiguration(actions:[like, share])
    }
}
