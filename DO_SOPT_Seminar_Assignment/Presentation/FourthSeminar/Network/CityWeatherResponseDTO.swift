//
//  CityWeatherDataModel.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/11/15.
//

import Foundation

// MARK: - CityWeatherResponseDTO

struct CityWeatherResponseDTO: Codable {
    let location: Location
    let current: Current
    let forecast: Forecast
}

// MARK: - Current
struct Current: Codable {
    let last_updated_epoch: Int
    let last_updated: String
    let temp_c: Double
    let temp_f: Double
    let is_day: Int
    let condition: Condition
    let wind_mph, wind_kph: Double
    let wind_degree: Int
    let wind_dir: String
    let pressure_mb: Int
    let pressure_in: Double
    let precip_mm, precip_in, humidity, cloud: Double
    let feelslike_c, feelslike_f: Double
    let vis_km, vis_miles, uv: Double
    let gust_mph, gust_kph: Double
}

// MARK: - Condition
struct Condition: Codable {
    let text: String
    let icon: String
    let code: Int
}

// MARK: - Forecast
struct Forecast: Codable {
    let forecastday: [Forecastday]
}

// MARK: - Forecastday
struct Forecastday: Codable {
    let date: String
    let date_epoch: Int
    let day: Day
    let astro: Astro
    let hour: [Hour]
}

// MARK: - Astro
struct Astro: Codable {
    let sunrise, sunset, moonrise, moonset: String
    let moon_phase: String
    let moon_illumination, is_moon_up, is_sun_up: Int
}

// MARK: - Day
struct Day: Codable {
    let maxtemp_c, maxtemp_f, mintemp_c, mintemp_f: Double
    let avgtemp_c, avgtemp_f, maxwind_mph, maxwind_kph: Double
    let totalprecip_mm, totalprecip_in, totalsnow_cm, avgvis_km: Double
    let avgvis_miles, avghumidity, daily_will_it_rain, daily_chance_of_rain: Int
    let daily_will_it_snow, daily_chance_of_snow: Int
    let condition: Condition
    let uv: Int
}

// MARK: - Hour
struct Hour: Codable {
    let time_epoch: Int
    let time: String
    let temp_c, temp_f: Double
    let is_day: Int
    let condition: Condition
    let wind_mph, wind_kph: Double
    let wind_degree: Int
    let wind_dir: String
    let pressure_mb: Int
    let pressure_in: Double
    let precip_mm, precip_in, humidity, cloud: Double
    let feelslike_c, feelslike_f, windchill_c, windchill_f: Double
    let heatindex_c, heatindex_f, dewpoint_c, dewpoint_f: Double
    let will_it_rain, chance_of_rain, will_it_snow, chance_of_snow: Int
    let vis_km, vis_miles: Double
    let gust_mph, gust_kph: Double
    let uv: Int
}

// MARK: - Location
struct Location: Codable {
    let name, region, country: String
    let lat: Double
    let lon: Double
    let tz_id: String
    let localtime_epoch: Int
    let localtime: String

    enum CodingKeys: String, CodingKey {
        case name, region, country, lat, lon
        case tz_id
        case localtime_epoch
        case localtime
    }
}
