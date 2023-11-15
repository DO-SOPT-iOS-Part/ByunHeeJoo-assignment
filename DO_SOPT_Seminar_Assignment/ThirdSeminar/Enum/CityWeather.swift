//
//  CityWeather.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/11/15.
//

import Foundation

@frozen
enum CityWeather: String {
    case cloudy = "Clouds"
    case sunny = "Suns"
    case clear = "Clear"
    case rainy = "Rains"
    case jeju = "Jeju"
    
    var description: String {
        switch self {
        case .cloudy:
            return "흐림"
        case .sunny:
            return "밝음"
        case .clear:
            return "맑음"
        case .rainy:
            return "비가 내림"
        case .jeju:
            return "제주"
        }
    }
}
