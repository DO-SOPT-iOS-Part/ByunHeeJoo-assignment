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
    case cheongju = "Cheongju"
    case jeju = "Jeju"
    
    var description: String {
        switch self {
        case .seoul:
            return "서울"
        case .busan:
            return "부산"
        case .gwangju:
            return "광주"
        case .cheongju:
            return "청주"
        case .jeju:
            return "제주"
        }
        
    }
}
