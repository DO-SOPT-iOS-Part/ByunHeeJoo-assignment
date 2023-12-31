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
    case rainPossible = "Patchy rain possible"
    case lightRain = "Light rain"
    case cloudy = "Cloudy"
    case moderateRain = "Moderate rain"
    case drizzle = "Light drizzle"
    case rainShower = "Light rain shower"
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
        case .rainPossible:
            return "비내림"
        case .lightRain:
            return "비내림"
        case .cloudy:
            return "구름"
        case .moderateRain:
            return "비내림"
        case .drizzle:
            return "비내림"
        case .rainShower:
            return "비내림"
        case .freezingRain:
            return "비내림"
        case .fog:
            return "안개"
        case .lightDrizzle:
            return "비내림"
        case .patchSnow:
            return "눈내림"
        case .patchSleetPossible:
            return "눈내림"
        case .patchFreezingDrizzlePossible:
            return "눈내림"
        case .thunderyOutbreakPossible:
            return "천둥번개"
        case .blowingSnow:
            return "눈내림"
        case .blizzard:
            return "강풍"
        case .freezingFog:
            return "안개"
        case .heavyFreezingDrizzle:
            return "눈내림"
        case .heavyRain:
            return "비내림"
        case .moderateOrHeavyFreezingRain:
            return "비내림"
        case .lightSleet:
            return "진눈깨비"
        case .moderateOrHeavySleet:
            return "진눈깨비"
        case .patchyLightSnow:
            return "눈내림"
        case .lightSnow:
            return "눈내림"
        case .patchyModerateSnow:
            return "눈내림"
        case .moderateSnow:
            return "눈내림"
        case .patchyHeavySnow:
            return "눈내림"
        case .heavySnow:
            return "눈내림"
        case .icePellets:
            return "눈내림"
        case .moderateOrHeavyRainShower:
            return "비내림"
        case .torrentialRainShower:
            return "비내림"
        case .lightSleetShowers:
            return "진눈깨비"
        case .moderateOrHeavySleetShowers:
            return "진눈깨비"
        case .lightSnowShowers:
            return "눈내림"
        case .moderateOrHeavySnowShowers:
            return "눈내림"
        case .lightShowersOfIcePellets:
            return "눈내림"
        case .moderateOrHeavyShowersOfIcePellets:
            return "눈내림"
        case .patchyLightRainWithThunder:
            return "천둥번개"
        case .moderateOrHeavyRainWithThunder:
            return "천둥번개"
        case .patchyLightSnowWithThunder:
            return "천둥번개"
        case .moderateOrHeavySnowWithThunder:
            return "천둥번개"
        }
    }
}
