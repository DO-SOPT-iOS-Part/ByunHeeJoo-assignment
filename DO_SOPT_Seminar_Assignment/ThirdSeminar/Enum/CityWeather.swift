//
//  CityWeather.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/11/15.
//

import Foundation

@frozen
enum CityWeather: String {
    case clear = "Clear"
    case mist = "Mist"
    case overcast = "Overcast"
    case partly_cloudy = "Partly cloudy"
    case sunny = "Sunny"
    
    var description: String {
        switch self {
        case .clear:
            return "맑음"
        case .mist:
            return "안개"
        case .overcast:
            return "흐림"
        case .partly_cloudy:
            return "흐림"
        case .sunny:
            return "밝음"
        }
    }
}
