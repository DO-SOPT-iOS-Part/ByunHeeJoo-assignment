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
    
    private let divisionLine = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 0))

    private let timeLabel = UILabel()
    private let weatherImage = UIImageView()
    private let temperatureLabel = UILabel()
    
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
        timeLabel.do {
            $0.font = .displayMedium(ofSize: 17)
            $0.textColor = .white
        }
        temperatureLabel.do {
            $0.font = .displayMedium(ofSize: 22)
            $0.textColor = .white
        }
    }
    
    private func setLayout() {
        addSubviews(divisionLine, timeLabel, weatherImage, temperatureLabel)
        divisionLine.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
            $0.leading.equalToSuperview().inset(14.adjusted)
        }
        timeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14.adjusted)
            $0.leading.equalToSuperview().inset(20.adjusted)
        }
        weatherImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50.adjusted)
            $0.size.equalTo(44)
            $0.leading.equalToSuperview().inset(15.adjusted)
        }
        temperatureLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(108.adjusted)
            $0.leading.equalToSuperview().inset(21.adjusted)
        }
        
    }
    
    func configureCell(weather: WeatherDetail) {
        timeLabel.text = weather.time
        weatherImage.image = weather.weather
        temperatureLabel.text = weather.temperature
    }
}
