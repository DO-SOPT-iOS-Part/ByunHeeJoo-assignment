//
//  WeatherDetail.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/10/26.
//

import UIKit

struct WeatherDetail {
    let time: String
    let weather: UIImage
    let temperature: String
}

extension WeatherDetail {
    static func dummy() -> [WeatherDetail] {
        return [WeatherDetail(time: "Now",
                              weather: ImageLiterals.icon.icCloud,
                              temperature: "6°"),
                WeatherDetail(time: "10시",
                              weather: ImageLiterals.icon.icLittleRain,
                              temperature: "6°"),
                WeatherDetail(time: "11시",
                              weather: ImageLiterals.icon.icLotOfRain,
                              temperature: "7°"),
                WeatherDetail(time: "12시",
                              weather: ImageLiterals.icon.icLightning,
                              temperature: "7°"),
                WeatherDetail(time: "13시",
                              weather: ImageLiterals.icon.icFoxRain,
                              temperature: "7°"),
                WeatherDetail(time: "14시",
                              weather: ImageLiterals.icon.icLittleRain,
                              temperature: "7°"),
                WeatherDetail(time: "15시",
                              weather: ImageLiterals.icon.icCloud,
                              temperature: "6°"),
                WeatherDetail(time: "16시",
                              weather: ImageLiterals.icon.icCloud,
                              temperature: "5°"),
                WeatherDetail(time: "17시",
                              weather: ImageLiterals.icon.icCloud,
                              temperature: "5°"),
                WeatherDetail(time: "18시",
                              weather: ImageLiterals.icon.icLotOfRain,
                              temperature: "5°"),
                WeatherDetail(time: "19시",
                              weather: ImageLiterals.icon.icLotOfRain,
                              temperature: "4°"),
                WeatherDetail(time: "20시",
                              weather: ImageLiterals.icon.icLightning,
                              temperature: "4°"),
                WeatherDetail(time: "21시",
                              weather: ImageLiterals.icon.icLittleRain,
                              temperature: "4°")]}
}
