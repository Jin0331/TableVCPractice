//
//  Shoping.swift
//  TableVCPractice
//
//  Created by JinwooLee on 1/8/24.
//

import Foundation
import UIKit

struct Shoping {
    var item : String
    var checkBox : Bool
    var bookMark : Bool
}

struct ShopingList {
    var shoping = [
        Shoping(item: "그립톡 구매하기", checkBox: true, bookMark: true),
        Shoping(item: "사이다 구매", checkBox: false, bookMark: false),
        Shoping(item: "아이패드 케이스 최저가 알아보기", checkBox: false, bookMark: true),
        Shoping(item: "양말", checkBox: false, bookMark: true),
    ]
}
