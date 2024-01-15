//
//  CityInfoViewController.swift
//  TableVCPractice
//
//  Created by JinwooLee on 1/9/24.
// https://stackoverflow.com/questions/25289375/uisegmentedcontroller-switch-between-collectionview-tableview

import UIKit
import Kingfisher

class CityInfoViewController: UIViewController {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var cityCollectionView: UICollectionView!
    @IBOutlet var searchBar: UISearchBar!
    
    var cityList = CityInfo().city { // segment 용
        didSet {
            cityListSearch = cityList
            cityCollectionView.reloadData()
        }
    }
    var cityListSearch = CityInfo().city {
        didSet {
            cityCollectionView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        connectCollectionView()
        
        // layout
        cityCollectionView.collectionViewLayout = configureCellLayout()
        
        segmentMoved(segmentControl) // IBAction 초기실행
    }
    
    @IBAction func segmentMoved(_ sender: UISegmentedControl) {
        cityListSearch = cityList // 초기화
        
        let segmentIndex = sender.selectedSegmentIndex
        
        switch segmentIndex {
        case CitySegemnt.domestic.index, CitySegemnt.foreign.index :
            cityListSearch = travleFiltering(arr: cityListSearch, segmentIndex: segmentIndex)
        default : // CitySegemnt.all.index :
            cityListSearch = cityList
        }
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
    
    func configureCellLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        
        let spacing : CGFloat = 15
        let cellWidth = UIScreen.main.bounds.width - (spacing * 3)
        
        layout.itemSize = CGSize(width: cellWidth / 2, height: (cellWidth+60) / 2) // 셀의 크기
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.scrollDirection = .vertical
        
        return layout
    }
    
    // Collection View 관련
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return cityListSearch.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = cityCollectionView.dequeueReusableCell(withReuseIdentifier: CityInfoCollectionViewCell.identifier, for: indexPath) as! CityInfoCollectionViewCell
        
        let items = cityListSearch[indexPath.item]
        
        cell.configureImageIntoCell(cell: items)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let sb = UIStoryboard(name: CityDetailViewController.identifier, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: CityDetailViewController.identifier) as! CityDetailViewController
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension CityInfoViewController {
    func travleFiltering(arr : [City], segmentIndex sg : Int ) -> [City] {
        let temp = arr.map({ (item : City) -> City? in
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

extension CityInfoViewController : UISearchBarDelegate {
    
    func configureSearchBar() {
        searchBar.delegate = self
    }
    
    func filterFunction () {
        var filterData : [City] = []
        let searchKeyword : String = searchBar.text!.lowercased().trimmingCharacters(in: .whitespaces) // 대소문자구분 x, whitespaces 제거 검색
        print(searchKeyword)
        
        if searchKeyword != "" {
            for item in cityListSearch {
                if item.city_name.contains(searchKeyword) ||  item.city_english_name.lowercased().contains(searchKeyword) ||
                    item.city_explain.contains(searchKeyword) {
                    filterData.append(item)
                } // if
            } // for
            cityListSearch = filterData
        } else {
            segmentMoved(segmentControl)
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterFunction()
    }
    
}
