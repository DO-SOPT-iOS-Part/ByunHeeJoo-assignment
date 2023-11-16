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
    case patchSnow = "Patchy snow possible"
    case patchSleetPossible = "Patchy sleet possible"
    case patchFreezingDrizzlePossible = "Patchy freezing drizzle possible"
    case thunderyOutbreakPossible = "Thundery outbreaks possible"
    case blowingSnow = "Blowing snow"
    case blizzard = "Blizzard"
    case freezingFog = "Freezing fog"
    case heavyFreezingDrizzle = "Heavy freezing drizzle"
    case heavyRain = "Heavy rain"
    case moderateOrHeavyFreezingRain = "Moderate or heavy freezing rain"
    case lightSleet = "Light sleet"
    case moderateOrHeavySleet = "Moderate or heavy sleet"
    case patchyLightSnow = "Patchy light snow"
    case lightSnow = "Light snow"
    case patchyModerateSnow = "Patchy moderate snow"
    case moderateSnow = "Moderate snow"
    case patchyHeavySnow = "Patchy heavy snow"
    case heavySnow = "Heavy snow"
    case icePellets = "Ice pellets"
    case moderateOrHeavyRainShower = "Moderate or heavy rain shower"
    case torrentialRainShower = "Torrential rain shower"
    case lightSleetShowers = "Light sleet showers"
    case moderateOrHeavySleetShowers = "Moderate or heavy sleet showers"
    case lightSnowShowers = "Light snow showers"
    case moderateOrHeavySnowShowers = "Moderate or heavy snow showers"
    case lightShowersOfIcePellets = "Light showers of ice pellets"
    case moderateOrHeavyShowersOfIcePellets = "Moderate or heavy showers of ice pellets"
    case patchyLightRainWithThunder = "Patchy light rain with thunder"
    case moderateOrHeavyRainWithThunder = "Moderate or heavy rain with thunder"
    case patchyLightSnowWithThunder = "Patchy light snow with thunder"
    case moderateOrHeavySnowWithThunder = "Moderate or heavy snow with thunder"
    
    
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
        case .patchSnow:
            return ImageLiterals.icon.icSnow
        case .patchSleetPossible:
            return ImageLiterals.icon.icSnow
        case .patchFreezingDrizzlePossible:
            return ImageLiterals.icon.icSnow
        case .thunderyOutbreakPossible:
            return ImageLiterals.icon.icLightning
        case .blowingSnow:
            return ImageLiterals.icon.icSnow
        case .blizzard:
            return ImageLiterals.icon.icWind
        case .freezingFog:
            return ImageLiterals.icon.icCloud
        case .heavyFreezingDrizzle:
            return ImageLiterals.icon.icLotOfRain
        case .heavyRain:
            return ImageLiterals.icon.icLotOfRain
        case .moderateOrHeavyFreezingRain:
            return ImageLiterals.icon.icLotOfRain
        case .lightSleet:
            return ImageLiterals.icon.icSnow
        case .moderateOrHeavySleet:
            return ImageLiterals.icon.icSnow
        case .patchyLightSnow:
            return ImageLiterals.icon.icSnow
        case .lightSnow:
            return ImageLiterals.icon.icSnow
        case .patchyModerateSnow:
            return ImageLiterals.icon.icSnow
        case .moderateSnow:
            return ImageLiterals.icon.icSnow
        case .patchyHeavySnow:
            return ImageLiterals.icon.icSnow
        case .heavySnow:
            return ImageLiterals.icon.icSnow
        case .icePellets:
            return ImageLiterals.icon.icSnow
        case .moderateOrHeavyRainShower:
            return ImageLiterals.icon.icLotOfRain
        case .torrentialRainShower:
            return ImageLiterals.icon.icLotOfRain
        case .lightSleetShowers:
            return ImageLiterals.icon.icSnow
        case .moderateOrHeavySleetShowers:
            return ImageLiterals.icon.icSnow
        case .lightSnowShowers:
            return ImageLiterals.icon.icSnow
        case .moderateOrHeavySnowShowers:
            return ImageLiterals.icon.icSnow
        case .lightShowersOfIcePellets:
            return ImageLiterals.icon.icSnow
        case .moderateOrHeavyShowersOfIcePellets:
            return ImageLiterals.icon.icSnow
        case .patchyLightRainWithThunder:
            return ImageLiterals.icon.icLightning
        case .moderateOrHeavyRainWithThunder:
            return ImageLiterals.icon.icLightning
        case .patchyLightSnowWithThunder:
            return ImageLiterals.icon.icLightning
        case .moderateOrHeavySnowWithThunder:
            return ImageLiterals.icon.icLightning
        }
    }
}
