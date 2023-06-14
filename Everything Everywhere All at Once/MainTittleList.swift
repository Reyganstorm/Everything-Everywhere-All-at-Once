//
//  MainTittleList.swift
//  Everything Everywhere All at Once
//
//  Created by Руслан Штыбаев on 14.06.2023.
//

import Foundation

enum MainTittleList: Int, CaseIterable {
    case lottie = 0
    case second
    case third
    case four
    
    var tittle: String {
        switch self {
        case .lottie:
            return "Lottie Animations"
        case .second:
            return "Second"
        case .third:
            return "Third"
        case .four:
            return "Four"
        }
    }
}