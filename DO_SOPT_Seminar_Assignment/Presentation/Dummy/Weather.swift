//
//  Stack.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/10/27.
//

import UIKit

struct Weather {
    let place: String
    let weather: String
    let temperature: String
    let highLowTemperature: String
}

extension Weather {
    static func dummy() -> [Weather] {
        return [Weather(place: StringLiterals.firstWeather.firstPlace,
                        weather: StringLiterals.firstWeather.firstWeather,
                        temperature: StringLiterals.firstWeather.firstTemperature,
                        highLowTemperature: StringLiterals.firstWeather.firstHighLowTemperature),
                Weather(place: StringLiterals.secondWeather.secondPlace,
                        weather: StringLiterals.secondWeather.secondWeather,
                        temperature: StringLiterals.secondWeather.secondTemperature,
                        highLowTemperature: StringLiterals.secondWeather.secondHighLowTemperature),
                Weather(place: StringLiterals.thirdWeather.thirdPlace,
                        weather: StringLiterals.thirdWeather.thirdWeather,
                        temperature: StringLiterals.thirdWeather.thirdTemperature,
                        highLowTemperature: StringLiterals.thirdWeather.thirdHighLowTemperature),
                Weather(place: StringLiterals.fourthWeather.fourthPlace,
                        weather: StringLiterals.fourthWeather.fourthWeather,
                        temperature: StringLiterals.fourthWeather.fourthTemperature,
                        highLowTemperature: StringLiterals.fourthWeather.fourthHighLowTemperature),
                Weather(place: StringLiterals.fifthWeather.fifthPlace,
                        weather: StringLiterals.fifthWeather.fifthWeather,
                        temperature: StringLiterals.fifthWeather.fifthTemperature,
                        highLowTemperature: StringLiterals.fifthWeather.fifthHighLowTemperature),
                Weather(place: StringLiterals.sixthWeather.sixthdPlace,
                        weather: StringLiterals.sixthWeather.sixthWeather,
                        temperature: StringLiterals.sixthWeather.sixthTemperature,
                        highLowTemperature: StringLiterals.sixthWeather.sixthHighLowTemperature),
                Weather(place: StringLiterals.seventhWeather.seventhPlace,
                        weather: StringLiterals.seventhWeather.seventhWeather,
                        temperature: StringLiterals.seventhWeather.seventhTemperature,
                        highLowTemperature: StringLiterals.seventhWeather.seventhHighLowTemperature)]}
}


