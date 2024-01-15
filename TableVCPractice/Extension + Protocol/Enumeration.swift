//
//  Enumeration.swift
//  TableVCPractice
//
//  Created by JinwooLee on 1/15/24.
//

import Foundation
import UIKit

enum CitySegemnt {
    case all
    case domestic
    case foreign
    
    var index : Int {
        switch self {
        case .all :
            return 0
        case .domestic :
            return 1
        case .foreign :
            return 2
        }
    }
}
