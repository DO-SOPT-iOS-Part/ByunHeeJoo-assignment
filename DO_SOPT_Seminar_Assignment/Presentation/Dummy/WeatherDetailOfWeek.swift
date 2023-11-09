//
//  WeatherDetailOfWeek.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/11/04.
//

import UIKit

struct WeatherDetailOfWeek {
    let day: String
    let weather: UIImage
    let rainyPercent: String
    let lowTemperature: String
    let highTemperature: String
}

extension WeatherDetailOfWeek {
    static func dummy() -> [WeatherDetailOfWeek] {
        return [WeatherDetailOfWeek(day: "오늘", weather: ImageLiterals.icon.icSun, rainyPercent: "", lowTemperature: "15°", highTemperature: "29°"),
                WeatherDetailOfWeek(day: "월", weather: ImageLiterals.icon.icLittleRain, rainyPercent: "60%", lowTemperature: "18°", highTemperature: "27°"),
                WeatherDetailOfWeek(day: "화", weather: ImageLiterals.icon.icLittleRain, rainyPercent: "60%", lowTemperature: "20°", highTemperature: "25°"),
                WeatherDetailOfWeek(day: "수", weather: ImageLiterals.icon.icLittleRain, rainyPercent: "70%", lowTemperature: "17°", highTemperature: "25°"),
                WeatherDetailOfWeek(day: "목", weather: ImageLiterals.icon.icLittleRain, rainyPercent: "50%", lowTemperature: "17°", highTemperature: "25°"),
                WeatherDetailOfWeek(day: "금", weather: ImageLiterals.icon.icSunCloud, rainyPercent: "", lowTemperature: "20°", highTemperature: "26°"),
                WeatherDetailOfWeek(day: "토", weather: ImageLiterals.icon.icSun, rainyPercent: "", lowTemperature: "18°", highTemperature: "25°"),
                WeatherDetailOfWeek(day: "일", weather: ImageLiterals.icon.icLittleRain, rainyPercent: "50%", lowTemperature: "13°", highTemperature: "21°"),
                WeatherDetailOfWeek(day: "월", weather: ImageLiterals.icon.icLittleRain, rainyPercent: "50%", lowTemperature: "12°", highTemperature: "19°"),
                WeatherDetailOfWeek(day: "화", weather: ImageLiterals.icon.icSun, rainyPercent: "", lowTemperature: "18°", highTemperature: "25°"),
                WeatherDetailOfWeek(day: "수", weather: ImageLiterals.icon.icSun, rainyPercent: "", lowTemperature: "18°", highTemperature: "25°")]}
}

