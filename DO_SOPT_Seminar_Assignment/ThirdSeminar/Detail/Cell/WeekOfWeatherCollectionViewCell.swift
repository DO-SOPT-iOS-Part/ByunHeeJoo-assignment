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
    
    // MARK: - UI Component

    private let divisionLine = UIView(frame: CGRect(x: 0, y: 0, width: 305
        .adjusted, height: 0))
    private let dayLabel = UILabel()
    private let weatherImage = UIImageView()
    private let rainyPercent = UILabel()
    private let lowTemperatureLabel = UILabel()
    private let progressBackgroud = UIProgressView()
    private let dotBackground = UIView()
    private let whiteDot = UIImageView()
    private var gradientLayer: CAGradientLayer?
    private let highTemperatureLabel = UILabel()
    
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
        
        dotBackground.do {
            $0.backgroundColor = .black
            $0.makeCornerRound(radius: 4.adjusted)
        }
        
        whiteDot.do {
            $0.image = ImageLiterals.icon.whiteDot
        }
    }
    
    // MARK: - UI Layout

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
    
    // MARK: - Custom ProgresssView

    private func setProgressView(x: CGFloat, width: CGFloat) {
        gradientLayer?.removeFromSuperlayer()
        let colors: [CGColor] = [
            .init(red: 0.42, green: 0.82, blue: 0.98, alpha: 1),
            .init(red: 0.51, green: 0.82, blue: 0.85, alpha: 1),
            .init(red: 0.59, green: 0.82, blue: 0.76, alpha: 1),
            .init(red: 0.72, green: 0.82, blue: 0.67, alpha: 1)
        ]
        progressBackgroud.layoutIfNeeded() // 현재 뷰의 크기를 강제로 설정
        let frame = CGRect(x: x * (100 / 18), y: 0, width: progressBackgroud.bounds.size.width * width, height: progressBackgroud.bounds.size.height)
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
        configureCell(weather: .init(day: "", weather: UIImage(), rainyPercent: "", lowTemperature: "", highTemperature: ""), index: 0)
    }
    
    // MARK: - Configure Cell

    func configureCell(weather: WeatherDetailOfWeek, index: Int) {
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
        
        let totalWidth = 18.0
        let realWidth = Float(highToFloat - lowToFloat) / Float(totalWidth)
        
        let x = lowToFloat - (-3)
        setProgressView(x: CGFloat(x), width: CGFloat(realWidth))
        if index == 0 {
            progressBackgroud.addSubview(dotBackground)
            dotBackground.addSubview(whiteDot)
            dotBackground.snp.makeConstraints {
                $0.size.equalTo(7.adjusted)
                $0.center.equalToSuperview()
            }
            
            whiteDot.snp.makeConstraints {
                $0.size.equalTo(4.adjusted)
                $0.center.equalToSuperview()
            }
        } else {
            dotBackground.removeFromSuperview()
        }
    }
}
