//
//  File.swift
//  TableVCPractice
//
//  Created by JinwooLee on 1/12/24.
//

import Foundation

// tableViewCell에서 identifier
protocol setTableViewCell {
    static var identifier : String {get}
    func setDesignTableCell (cell : ChatRoom)
}

// UIViewController
protocol setUIView {
    static var identifier : String {get}
    static var storyboard : String {get}
    func configureUIView()
    func configureDesign()
}
