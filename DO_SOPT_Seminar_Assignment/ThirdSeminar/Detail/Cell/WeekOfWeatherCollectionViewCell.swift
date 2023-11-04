//
//  WeekOfWeatherCollectionViewCell.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/11/04.
//

import UIKit

import SnapKit
import Then

final class WeekOfWeatherCollectionViewCell: UICollectionViewCell {
    
    private let divisionLine = UIView(frame: CGRect(x: 0, y: 0, width: 305
        .adjusted, height: 0))
    private let dayLabel = UILabel()
    private let weatherImage = UIImageView()
    private let rainyPercent = UILabel()
    private let lowTemperatureLabel = UILabel()
    private let progressBackgroud = UIProgressView()
    private let highTemperatureLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setStyle() {
        divisionLine.do {
            $0.layer.addBorder([.top], color: UIColor.systemGray, width: 0.5)
        }
        
        dayLabel.do {
            $0.font = .displayMedium(ofSize: 22)
            $0.textColor = .white
        }
        
        lowTemperatureLabel.do {
            $0.font = .displayMedium(ofSize: 22)
            $0.textColor = .gray
        }
        
        rainyPercent.do {
            $0.font = .displayBold(ofSize: 15)
            $0.textColor = UIColor(hexCode: "#81CFFA")
        }
        
        progressBackgroud.do {
            $0.backgroundColor = .darkGray
            $0.makeCornerRound(radius: 3.adjusted)
        }
        
        highTemperatureLabel.do {
            $0.font = .displayMedium(ofSize: 22)
            $0.textColor = .white
        }
    }
    
    private func setLayout() {
        addSubviews(divisionLine,
                    dayLabel,
                    weatherImage,
                    rainyPercent,
                    lowTemperatureLabel,
                    progressBackgroud,
                    highTemperatureLabel)
        
        divisionLine.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(15.adjusted)
            $0.width.equalTo(310.adjusted)
        }
        
        dayLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16.adjusted)
            $0.centerY.equalToSuperview()
        }
        
        weatherImage.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(82.adjusted)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(26.adjusted)
        }
        
        lowTemperatureLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(130.adjusted)
            $0.centerY.equalToSuperview()
        }
        
        progressBackgroud.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(171.adjusted)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(100.adjusted)
            $0.height.equalTo(3.adjusted)
        }
        
        highTemperatureLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(17.adjusted)
            $0.centerY.equalToSuperview()
        }
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        configureCell(weather: .init(day: "", weather: UIImage(), rainyPercent: "", lowTemperature: "", highTemperature: ""))
    }
    
    func configureCell(weather: WeatherDetailOfWeek) {
        dayLabel.text = weather.day
        weatherImage.image = weather.weather
        rainyPercent.text = weather.rainyPercent
        
        if rainyPercent.text != "" {
            weatherImage.snp.remakeConstraints {
                $0.leading.equalToSuperview().inset(75.adjusted)
                $0.top.equalToSuperview().inset(3.adjusted)
                $0.size.equalTo(40.adjusted)
            }
            rainyPercent.snp.makeConstraints {
                $0.leading.equalToSuperview().inset(81.adjusted)
                $0.top.equalToSuperview().inset(33.adjusted)
            }
        } else if weatherImage.image == ImageLiterals.icon.icSunCloud {
            weatherImage.snp.remakeConstraints {
                $0.leading.equalToSuperview().inset(81.adjusted)
                $0.centerY.equalToSuperview()
                $0.width.equalTo(32.adjusted)
                $0.height.equalTo(26.adjusted)
            }
        } else {
            weatherImage.snp.remakeConstraints {
                $0.leading.equalToSuperview().inset(82.adjusted)
                $0.centerY.equalToSuperview()
                $0.size.equalTo(26.adjusted)
            }
        }
        
        lowTemperatureLabel.text = weather.lowTemperature
        highTemperatureLabel.text = weather.highTemperature
    }
}
