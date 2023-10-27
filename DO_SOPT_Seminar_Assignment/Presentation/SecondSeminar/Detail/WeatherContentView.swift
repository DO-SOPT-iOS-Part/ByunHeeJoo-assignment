//
//  WeatherContentView.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/10/26.
//

import UIKit

import SnapKit
import Then

final class WeatherContentView: UIView {
    private let dummy = WeatherDetail.dummy() // 구조체 정보 불러오기
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setView() {

        let timeLabelTopInset = 14
        var timeLabelLeadingInset = 7
        let weatherImageTopInset = 50
        var weatherImageLeadingInset = 1
        let temperatureLabelTopInset = 108
        var temperatureLabelLeadingInset = 7
        
        for i in 0..<13 {
            let timeLabel = UILabel()
            timeLabel.text = dummy[i].time
            timeLabel.font = .displayMedium(ofSize: 17)
            timeLabel.textColor = .white
            addSubview(timeLabel)
            timeLabel.snp.makeConstraints {
                $0.top.equalToSuperview().inset(timeLabelTopInset)
                $0.leading.equalToSuperview().inset(timeLabelLeadingInset)
            }
            
            let weatherImage = UIImageView()
            weatherImage.image = dummy[i].weather
            addSubview(weatherImage)
            weatherImage.snp.makeConstraints {
                $0.top.equalToSuperview().inset(weatherImageTopInset)
                $0.leading.equalToSuperview().inset(weatherImageLeadingInset)
                $0.size.equalTo(44)
            }
            
            let temperatureLabel = UILabel()
            temperatureLabel.text = dummy[i].temperature
            temperatureLabel.font = .displayMedium(ofSize: 22)
            temperatureLabel.textColor = .white
            addSubview(temperatureLabel)
            temperatureLabel.snp.makeConstraints {
                $0.top.equalToSuperview().inset(temperatureLabelTopInset)
                $0.leading.equalToSuperview().inset(temperatureLabelLeadingInset)
            }
            
            timeLabelLeadingInset += 66
            weatherImageLeadingInset += 66
            temperatureLabelLeadingInset += 66
        }

    }
    
}
