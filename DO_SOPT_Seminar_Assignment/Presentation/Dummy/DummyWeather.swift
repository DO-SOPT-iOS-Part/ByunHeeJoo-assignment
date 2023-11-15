//
//  Stack.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/10/27.
//

import UIKit

struct DummyWeather {
    let place: String
    let weather: String
    let temperature: String
    let highLowTemperature: String
}

extension DummyWeather {
    static func dummy() -> [DummyWeather] {
        return [DummyWeather(place: StringLiterals.firstWeather.firstPlace,
                        weather: StringLiterals.firstWeather.firstWeather,
                        temperature: StringLiterals.firstWeather.firstTemperature,
                        highLowTemperature: StringLiterals.firstWeather.firstHighLowTemperature),
                DummyWeather(place: StringLiterals.secondWeather.secondPlace,
                        weather: StringLiterals.secondWeather.secondWeather,
                        temperature: StringLiterals.secondWeather.secondTemperature,
                        highLowTemperature: StringLiterals.secondWeather.secondHighLowTemperature),
                DummyWeather(place: StringLiterals.thirdWeather.thirdPlace,
                        weather: StringLiterals.thirdWeather.thirdWeather,
                        temperature: StringLiterals.thirdWeather.thirdTemperature,
                        highLowTemperature: StringLiterals.thirdWeather.thirdHighLowTemperature),
                DummyWeather(place: StringLiterals.fourthWeather.fourthPlace,
                        weather: StringLiterals.fourthWeather.fourthWeather,
                        temperature: StringLiterals.fourthWeather.fourthTemperature,
                        highLowTemperature: StringLiterals.fourthWeather.fourthHighLowTemperature),
                DummyWeather(place: StringLiterals.fifthWeather.fifthPlace,
                        weather: StringLiterals.fifthWeather.fifthWeather,
                        temperature: StringLiterals.fifthWeather.fifthTemperature,
                        highLowTemperature: StringLiterals.fifthWeather.fifthHighLowTemperature),
                DummyWeather(place: StringLiterals.sixthWeather.sixthdPlace,
                        weather: StringLiterals.sixthWeather.sixthWeather,
                        temperature: StringLiterals.sixthWeather.sixthTemperature,
                        highLowTemperature: StringLiterals.sixthWeather.sixthHighLowTemperature),
                DummyWeather(place: StringLiterals.seventhWeather.seventhPlace,
                        weather: StringLiterals.seventhWeather.seventhWeather,
                        temperature: StringLiterals.seventhWeather.seventhTemperature,
                        highLowTemperature: StringLiterals.seventhWeather.seventhHighLowTemperature)
                ]}
}


