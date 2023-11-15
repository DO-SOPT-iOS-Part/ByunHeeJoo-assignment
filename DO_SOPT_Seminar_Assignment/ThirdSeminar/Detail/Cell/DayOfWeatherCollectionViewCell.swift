//
//  DayOfWeatherCollectionViewCell.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/11/04.
//

import UIKit

import SnapKit
import Then

final class DayOfWeatherCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Component

    private let divisionLine = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 0))
    private let timeLabel = UILabel()
    private let weatherImage = UIImageView()
    private let temperatureLabel = UILabel()
    
    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - UI Style
    
    private func setStyle() {
        divisionLine.do {
            $0.layer.addBorder([.top], color: UIColor.systemGray, width: 0.5)
        }
        timeLabel.do {
            $0.font = .displayMedium(ofSize: 17)
            $0.textColor = .white
        }
        temperatureLabel.do {
            $0.font = .displayMedium(ofSize: 22)
            $0.textColor = .white
        }
    }
    
    // MARK: - UI Layout
    
    private func setLayout() {
        addSubviews(divisionLine, timeLabel, weatherImage, temperatureLabel)
        divisionLine.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        timeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14.adjusted)
            $0.centerX.equalToSuperview()
        }
        weatherImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50.adjusted)
            $0.size.equalTo(44.adjusted)
            $0.centerX.equalToSuperview()
        }
        temperatureLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(108.adjusted)
            $0.centerX.equalToSuperview()
        }
        
    }
    
    // MARK: - Configure Cell

    func configureCell(weather: WeatherOfDayDataModel) {
        let originalDateString = weather.currentTime
        if let convertedHour = Date.convertHourFormat(from: originalDateString) {
            timeLabel.text = convertedHour
        } else {
            print("날짜 변환에 실패했습니다.")
        }
        weatherImage.image = WeatherImage(rawValue: weather.currentImage)?.description
        if weatherImage.image == ImageLiterals.icon.icSun {
            weatherImage.snp.remakeConstraints {
                $0.top.equalToSuperview().inset(57.adjusted)
                $0.size.equalTo(30.adjusted)
                $0.centerX.equalToSuperview()
            }
        } else if weatherImage.image == ImageLiterals.icon.icSoCloud {
            weatherImage.snp.remakeConstraints {
                $0.top.equalToSuperview().inset(60.adjusted)
                $0.width.equalTo(28.adjusted)
                $0.height.equalTo(24.adjusted)
                $0.centerX.equalToSuperview()
            }
        }else if weatherImage.image == ImageLiterals.icon.icLittleRain || weatherImage.image == ImageLiterals.icon.icLotOfRain {
            weatherImage.snp.remakeConstraints {
                $0.top.equalToSuperview().inset(53.adjusted)
                $0.size.equalTo(44.adjusted)
                $0.centerX.equalToSuperview()
            }
        } else {
            weatherImage.snp.remakeConstraints {
                $0.top.equalToSuperview().inset(50.adjusted)
                $0.size.equalTo(44.adjusted)
                $0.centerX.equalToSuperview()
            }
        }
        temperatureLabel.text = String(Int(weather.currentTemperature)) + "°"
    }
}
