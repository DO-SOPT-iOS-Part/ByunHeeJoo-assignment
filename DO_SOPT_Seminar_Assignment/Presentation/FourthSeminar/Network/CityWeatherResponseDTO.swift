//
//  CityWeatherDataModel.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/11/15.
//

import Foundation

// MARK: - CityWeatherResponseDTO
struct CityWeatherResponseDTO: Decodable {
    let location: Location
    let current: Current
}

// MARK: - Current
struct Current: Decodable {
    let lastUpdatedEpoch: Int
    let lastUpdated: String
    let tempC: Int
    let tempF: Double
    let isDay: Int
    let condition: Condition
    let windMph: Double
    let windKph, windDegree: Int
    let windDir: String
    let pressureMB: Int
    let pressureIn: Double
    let precipMm, precipIn, humidity, cloud: Int
    let feelslikeC: Int
    let feelslikeF: Double
    let visKM, visMiles, uv: Int
    let gustMph, gustKph: Double
}

// MARK: - Condition
struct Condition: Decodable {
    let text, icon: String
    let code: Int
}

// MARK: - Location
struct Location: Decodable {
    let name, region, country: String
    let lat: Double
    let lon: Int
    let tzID: String
    let localtimeEpoch: Int
    let localtime: String
}
