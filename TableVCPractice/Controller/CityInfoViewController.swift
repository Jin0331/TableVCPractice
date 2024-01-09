//
//  CityInfoViewController.swift
//  TableVCPractice
//
//  Created by JinwooLee on 1/9/24.
// https://stackoverflow.com/questions/25289375/uisegmentedcontroller-switch-between-collectionview-tableview

import UIKit

class CityInfoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var cityList = CityInfo()
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var cityCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // collection View Cell Xib
        cityCollectionView.dataSource = self
        cityCollectionView.delegate = self
        
        let xib = UINib(nibName: CityInfoIdentifier.cellDesign1.rawValue, bundle: nil)
        cityCollectionView.register(xib, forCellWithReuseIdentifier:  CityInfoIdentifier.cellDesign1.rawValue)
        
        // layout
        cityCollectionView.collectionViewLayout = CityInfoCollectionViewCell.configureCellLayout()
    }
    
    @IBAction func segmentMoved(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
        
    }
    
    //MARK: - Collection View 관련
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return cityList.city.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = cityCollectionView.dequeueReusableCell(withReuseIdentifier: CityInfoIdentifier.cellDesign1.rawValue, for: indexPath) as! CityInfoCollectionViewCell
        
        let items = cityList.city[indexPath.item]
    
        cell.configureCell(cell: items)
        
//        cell.isHidden = false
        
        return cell
    }

}
