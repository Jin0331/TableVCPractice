//
//  Setting.swift
//  TableVCPractice
//
//  Created by JinwooLee on 1/10/24.
//

import Foundation

struct Setting {
    var headerList : String
    var dataList : [String]
}

struct SettingList {
    let list : [Setting] = [
        Setting(headerList: "전체 섫정", dataList: ["공지사항", "실험실", "버전 정보"]),
        Setting(headerList: "개인 섫정", dataList: ["개인/보안", "알림", "채팅", "멀티프로필"]),
        Setting(headerList: "기타", dataList: ["고객센터/도움말"]),
    ]
}
