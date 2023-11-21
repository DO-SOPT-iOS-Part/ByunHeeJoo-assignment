//
//  CithWeatherService.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/11/15.
//

import Foundation

class CityWeatherService {
    static let shared = CityWeatherService()
    private init() {}
    
    func makeRequest(cityName: String) -> URLRequest {
        // URL 인코딩
        guard let encodedCityName = cityName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            fatalError("Failed to encode username")
        }

        let apiKey = Bundle.main.object(forInfoDictionaryKey: Config.Keys.Plist.apiKey) as? String ?? ""
        
        let urlString =
        "https://api.weatherapi.com/v1/forecast.json?q=\(encodedCityName)&days=1&key=\(apiKey)"
        
        // URL 생성
        guard let url = URL(string: urlString) else {
            fatalError("Failed to create URL")
        }

        // URLRequest 생성
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // 헤더 추가
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        
        return request
    }

    
    func GetRegisterData(cityName: String) async throws -> CityWeatherResponseDTO? {
        do {
            let request = self.makeRequest(cityName: cityName)
            let (data, response) = try await URLSession.shared.data(for: request)
            dump(request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.responseError
            }
            dump(response)
            return parseCityWeatherData(data: data)
        } catch {
            throw error
        }
        
    }
    
    
    private func parseCityWeatherData(data: Data) -> CityWeatherResponseDTO? {
        do {
            let jsonDecoder = JSONDecoder()
            let result = try jsonDecoder.decode(CityWeatherResponseDTO.self, from: data)
            return result
        } catch {
            print(error)
            return nil
        }
    }
    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode)
        ?? NetworkError.unknownError
    }
    
}
