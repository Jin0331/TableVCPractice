//
//  CityInfoCollectionViewController.swift
//  TableVCPractice
//
//  Created by JinwooLee on 1/9/24.
//

import UIKit


class CityInfoCollectionViewController: UICollectionViewController {
    
    var cityList = CityInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // layout
        collectionView.collectionViewLayout = CityInfoCollectionViewCell.configureCellLayout()
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return cityList.city.count
    }
    
    // 로직
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CityInfoIdentifier.cellDesign1.rawValue, for: indexPath) as! CityInfoCollectionViewCell
        
        let items = cityList.city[indexPath.item]
        
        cell.configureCell(cell: items)
        
        return cell
    }

}
