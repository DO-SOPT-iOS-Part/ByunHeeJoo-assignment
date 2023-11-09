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
    private var gradientLayer: CAGradientLayer?
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
            $0.backgroundColor = .black
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
            $0.height.equalTo(4.adjusted)
        }
        
        highTemperatureLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(17.adjusted)
            $0.centerY.equalToSuperview()
        }
        
    }
    
    private func setProgressView(x: CGFloat, width: CGFloat) {
        gradientLayer?.removeFromSuperlayer()
        let colors: [CGColor] = [
            .init(red: 0.59, green: 0.82, blue: 0.66, alpha: 1),
            .init(red: 0.72, green: 0.81, blue: 0.47, alpha: 1),
            .init(red: 0.97, green: 0.84, blue: 0.29, alpha: 1),
            .init(red: 0.94, green: 0.53, blue: 0.21, alpha: 1)
        ]
        progressBackgroud.layoutIfNeeded() // 현재 뷰의 크기를 강제로 설정
        let frame = CGRect(x: x * (100 / 17), y: 0, width: progressBackgroud.bounds.size.width * width, height: progressBackgroud.bounds.size.height)
        gradientLayer = CAGradientLayer()
        gradientLayer?.frame = frame
        
        if width < 0.5 && x < 3 {
            let gradientColor: [CGColor] = [colors[0], colors[1]]
            gradientLayer?.colors = gradientColor
        } else if width < 0.5 && x > 3 {
            let gradientColor: [CGColor] = [colors[1], colors[2]]
            gradientLayer?.colors = gradientColor
        } else {
            gradientLayer?.colors = colors
        }
        
        gradientLayer?.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer?.endPoint = CGPoint(x: 1.0,  y: 0.0)
        gradientLayer?.cornerRadius = 3.adjusted
        if let gradientLayer = gradientLayer {
            progressBackgroud.layer.addSublayer(gradientLayer)
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
        
        let (highString, _) = weather.highTemperature.splitLastString()
        let highToFloat: Float = Float(highString) ?? 0
        let (lowString, _) = weather.lowTemperature.splitLastString()
        let lowToFloat: Float = Float(lowString) ?? 0
        
        let totalWidth = 17.0
        let realWidth = Float(highToFloat - lowToFloat) / Float(totalWidth)
        
        let x = lowToFloat - 12.0
        setProgressView(x: CGFloat(x), width: CGFloat(realWidth))
    }
}
