//
//  WeatherImage.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/11/16.
//

import UIKit

@frozen
enum WeatherImage: String {
    case clear = "Clear"
    case mist = "Mist"
    case overcast = "Overcast"
    case partly_cloudy = "Partly cloudy"
    case cloudy = "Cloudy"
    case sunny = "Sunny"
    case lightRain = "Light rain"
    case moderateRain = "Moderate rain"
    case drizzle = "Light drizzle"
    case rainShower = "Light rain shower"
    case patchRain = "Patchy rain possible"
    case freezingRain = "Light freezing rain"
    case fog = "Fog"
    case lightDrizzle = "Patchy light drizzle"
    
    var description: UIImage {
        switch self {
        case .clear:
            return ImageLiterals.icon.icSun
        case .mist:
            return ImageLiterals.icon.icSoCloud
        case .overcast:
            return ImageLiterals.icon.icCloud
        case .partly_cloudy:
            return ImageLiterals.icon.icCloud
        case .cloudy:
            return ImageLiterals.icon.icSoCloud
        case .sunny:
            return ImageLiterals.icon.icCloud
        case .lightRain:
            return ImageLiterals.icon.icLittleRain
        case .moderateRain:
            return ImageLiterals.icon.icLotOfRain
        case .drizzle:
            return ImageLiterals.icon.icLittleRain
        case .rainShower:
            return ImageLiterals.icon.icLittleRain
        case .patchRain:
            return ImageLiterals.icon.icLittleRain
        case .freezingRain:
            return ImageLiterals.icon.icLittleRain
        case .fog:
            return ImageLiterals.icon.icCloud
        case .lightDrizzle:
            return ImageLiterals.icon.icLittleRain
        }
    }
}
