//
//  MainWeatherCollectionViewCell.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/11/03.
//

import UIKit

import SnapKit
import Then

protocol ButtonTouchnAction: AnyObject {
    func backGroundTapped(index: Int)
}

final class MainWeatherCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: ButtonTouchnAction?

    // MARK: - UI Component

    private let basePlaceView = UIView()
    private let basePlaceViewBackground = UIButton()
    private let myPlaceLabel = UILabel()
    private let currentTimeLabel = UILabel()
    private let weatherLabel = UILabel()
    private let temperatureLabel = UILabel()
    private let highLowTemperatureLabel = UILabel()
    private var cellIndex = 0

    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        configureCell(weather: .init(cityName: "", currentTime: "", currentWeather: "", currentTemperature: 0.0, highTemperature: 0.0, lowTemperauture: 0.0), row: 0)
    }
    
    // MARK: - UI Style

    private func setStyle() {
        basePlaceViewBackground.do {
            $0.setImage(ImageLiterals.imgBackGround.imgQuarterBackground, for: .normal)
            $0.contentVerticalAlignment = .fill
            $0.contentHorizontalAlignment = .fill
            $0.addTarget(self, action: #selector(backGroundTapped), for: .touchUpInside)
        }
        
        myPlaceLabel.do {
            $0.textColor = .white
            $0.font = .displayBold(ofSize: 24)
        }
        
        currentTimeLabel.do {
            $0.textColor = .white
            $0.font = .displayMedium(ofSize: 17)
        }
        
        weatherLabel.do {
            $0.textColor = .white
            $0.font = .displayMedium(ofSize: 16)
        }
        
        temperatureLabel.do {
            $0.textColor = .white
            $0.font = .displayLight(ofSize: 52)
        }
        
        highLowTemperatureLabel.do {
            $0.textColor = .white
            $0.font = .displayMedium(ofSize: 15)
        }
    }
    
    // MARK: - UI Layout

    private func setLayout() {
        
        contentView.addSubview(basePlaceView)
        
        basePlaceView.addSubviews(basePlaceViewBackground,
                                  myPlaceLabel,
                                  currentTimeLabel,
                                  weatherLabel,
                                  temperatureLabel,
                                  highLowTemperatureLabel)
        
        basePlaceView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        basePlaceViewBackground.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        myPlaceLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10.adjusted)
            $0.leading.equalToSuperview().inset(16.adjusted)
        }
        
        currentTimeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(44.adjusted)
            $0.leading.equalToSuperview().inset(16.adjusted)
        }
        
        weatherLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10.adjusted)
            $0.leading.equalToSuperview().inset(16.adjusted)
        }
        
        temperatureLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(4.adjusted)
            $0.trailing.equalToSuperview().inset(16.adjusted)
        }
        
        highLowTemperatureLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16.adjusted)
            $0.bottom.equalToSuperview().inset(10.adjusted)
        }
    }
    
    // MARK: - Configure Cell
    
    func configureCell(weather: CityWeatherDataModel, row: Int) {
        
        myPlaceLabel.text = CityName(rawValue: weather.cityName)?.description
        
        let formatter_time = DateFormatter()
        formatter_time.dateFormat = "HH:mm"
        let current_time_string = formatter_time.string(from: Date())
        currentTimeLabel.text = String(current_time_string)

        weatherLabel.text = CityWeather(rawValue: weather.currentWeather)?.description
        
        temperatureLabel.text = String(Int(weather.currentTemperature)) + "°"
        highLowTemperatureLabel.text = "최고:" + String(Int(weather.highTemperature)) + "° " + " 최저:" + String(Int(weather.lowTemperauture)) + "°"
        cellIndex = row
    }
    
    // MARK: - Objc Function
    @objc func
    backGroundTapped(sender: UIButton) {
        delegate?.backGroundTapped(index: cellIndex)
    }
    
}
