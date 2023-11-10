//
//  InformationCollectionViewCell.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/11/09.
//

import UIKit

import SnapKit
import Then

final class InformationCollectionViewCell: UICollectionViewCell {
    let placeLabel = UILabel()
    let weatherLabel = UILabel()
    let temperatureLabel = UILabel()
    let highLowTemperatureLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setStyle() {
        placeLabel.do {
            $0.textColor = .white
            $0.font = .displayMedium(ofSize: 36)
        }
        
        temperatureLabel.do {
            $0.textColor = .white
            $0.font = .displayThin(ofSize: 102)
        }
        
        weatherLabel.do {
            $0.textColor = .white
            $0.font = .displayMedium(ofSize: 24)
        }
        
        highLowTemperatureLabel.do {
            $0.textColor = .white
            $0.font = .displayMedium(ofSize: 20)
        }
    }
    
    private func setLayout() {
        addSubviews(placeLabel, temperatureLabel, weatherLabel, highLowTemperatureLabel)
        placeLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }

        temperatureLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(42.adjusted)
            $0.centerX.equalToSuperview()
        }
        
        weatherLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(154.adjusted)
            $0.centerX.equalToSuperview()
        }
        
        highLowTemperatureLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(188.adjusted)
            $0.centerX.equalToSuperview()
        }
        
    }
    
    func configureCell(place: String, temperature: String, weather: String, highLowTemperature: String) {
        placeLabel.text = place
        temperatureLabel.text = temperature
        weatherLabel.text = weather
        highLowTemperatureLabel.text = highLowTemperature
        setLayout()
    }
}
