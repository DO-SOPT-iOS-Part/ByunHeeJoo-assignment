//
//  CityName.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/11/15.
//

import Foundation

@frozen
enum CityName: String {
    case seoul = "Seoul"
    case busan = "Busan"
    case gwangju = "Gwangju"
    case cheongju = "Cheongju-si"
    case jeju = "Jeju City"
    
    var description: String {
        switch self {
        case .seoul:
            return "서울특별시"
        case .busan:
            return "부산광역시"
        case .gwangju:
            return "광주광역시"
        case .cheongju:
            return "청주시"
        case .jeju:
            return "제주시"
        }
        
    }
}
