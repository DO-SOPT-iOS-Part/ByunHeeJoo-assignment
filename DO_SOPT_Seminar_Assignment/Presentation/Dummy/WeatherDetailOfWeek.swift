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
        return [WeatherDetailOfWeek(day: "오늘", weather: ImageLiterals.icon.icSun, rainyPercent: "", lowTemperature: "1°", highTemperature: "15°"),
                WeatherDetailOfWeek(day: "월", weather: ImageLiterals.icon.icLittleRain, rainyPercent: "60%", lowTemperature: "3°", highTemperature: "10°"),
                WeatherDetailOfWeek(day: "화", weather: ImageLiterals.icon.icLittleRain, rainyPercent: "60%", lowTemperature: "3°", highTemperature: "11°"),
                WeatherDetailOfWeek(day: "수", weather: ImageLiterals.icon.icLittleRain, rainyPercent: "70%", lowTemperature: "4°", highTemperature: "9°"),
                WeatherDetailOfWeek(day: "목", weather: ImageLiterals.icon.icLittleRain, rainyPercent: "50%", lowTemperature: "2°", highTemperature: "8°"),
                WeatherDetailOfWeek(day: "금", weather: ImageLiterals.icon.icSunCloud, rainyPercent: "", lowTemperature: "2°", highTemperature: "11°"),
                WeatherDetailOfWeek(day: "토", weather: ImageLiterals.icon.icSun, rainyPercent: "", lowTemperature: "-1°", highTemperature: "7°"),
                WeatherDetailOfWeek(day: "일", weather: ImageLiterals.icon.icLittleRain, rainyPercent: "50%", lowTemperature: "0°", highTemperature: "13°"),
                WeatherDetailOfWeek(day: "월", weather: ImageLiterals.icon.icLittleRain, rainyPercent: "50%", lowTemperature: "4°", highTemperature: "7°"),
                WeatherDetailOfWeek(day: "화", weather: ImageLiterals.icon.icSun, rainyPercent: "", lowTemperature: "-1°", highTemperature: "5°"),
                WeatherDetailOfWeek(day: "수", weather: ImageLiterals.icon.icSun, rainyPercent: "", lowTemperature: "-3°", highTemperature: "8°")]}
}

