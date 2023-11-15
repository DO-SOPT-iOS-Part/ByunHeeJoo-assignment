//
//  ReverseCityname.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/11/16.
//

@frozen
enum ReverseCityName: String {
    case seoul = "서울특별시"
    case busan = "부산광역시"
    case gwangju = "광주광역시"
    case cheongju = "청주시"
    case jeju = "춘천시"
    
    var description: String {
        switch self {
        case .seoul:
            return "Seoul"
        case .busan:
            return "Busan"
        case .gwangju:
            return "Gwangju"
        case .cheongju:
            return "Cheongju"
        case .jeju:
            return "Chuncheon"
        }
        
    }
}
