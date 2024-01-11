//
//  CityInfoViewController.swift
//  TableVCPractice
//
//  Created by JinwooLee on 1/9/24.
// https://stackoverflow.com/questions/25289375/uisegmentedcontroller-switch-between-collectionview-tableview

import UIKit
import Kingfisher

class CityInfoViewController: UIViewController {
    
    var cityList = CityInfo().city
    var segmentIndex : Int = 0
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var cityCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        connectCollectionView()
        
        // layout
        cityCollectionView.collectionViewLayout = configureCellLayout()
        
        segmentMoved(segmentControl)
    }
    
    @IBAction func segmentMoved(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
        cityList = CityInfo().city // 초기화
        
        segmentIndex = sender.selectedSegmentIndex
        
        print("segmentIndex \(segmentIndex)")
        
        switch segmentIndex {
        case 1,2 :
            cityList = travleFiltering(arr: cityList, segmentIndex: segmentIndex)
        default :
            cityList = CityInfo().city
    }
        cityCollectionView.reloadData()
    }

}


//MARK: - Extension
extension CityInfoViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    // Collection View UI
    func connectCollectionView() {
        // collection View Cell Xib
        cityCollectionView.dataSource = self
        cityCollectionView.delegate = self
        
        let xib = UINib(nibName: CityInfoCollectionViewCell.identifier, bundle: nil)
        cityCollectionView.register(xib, forCellWithReuseIdentifier:  CityInfoCollectionViewCell.identifier)
    }
    
    func configureCellLayout () -> UICollectionViewFlowLayout {
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
    
    // Collection View 관련
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return cityList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = cityCollectionView.dequeueReusableCell(withReuseIdentifier: CityInfoCollectionViewCell.identifier, for: indexPath) as! CityInfoCollectionViewCell
        
        let items = cityList[indexPath.item]

        cell.configureImageIntoCell(cell: items)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let sb = UIStoryboard(name: CityDetailViewController.stroyboard, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: CityDetailViewController.identifier) as! CityDetailViewController
        
        present(vc, animated: true)
        
    }
}

// String 처리 함수
extension CityInfoViewController {
    func travleFiltering(arr : [City], segmentIndex sg : Int ) -> [City] {
        let temp = arr.map({ (item : City) -> City? in
            print(type(of: item.domestic_travel))
            print(sg)
            let sgBool = sg == 1 ? true : false // 0은 들어오지 않는다. 오직 1,2
            if item.domestic_travel == sgBool {
                return item
            } else {
                return nil
            }
        })
        return temp.compactMap{$0}
    }
}
