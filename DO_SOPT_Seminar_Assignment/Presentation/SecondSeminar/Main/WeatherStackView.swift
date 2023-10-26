//
//  WeatherView.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/10/27.
//

import UIKit

import SnapKit
import Then

protocol BackGroundButtonAction: AnyObject {
    func backGroundTapped()
}

final class WeatherStackView: UIView {
    
    private let dummy = Weather.dummy()
    weak var delegate: BackGroundButtonAction?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setView() {

        var placeViewTopInset = 0
        
        for i in 0..<7 {
            let placeView = UIView()
            let placeViewBackGround = UIButton()
            let myPlaceLabel = UILabel()
            let placeLabel = UILabel()
            let weatherLabel = UILabel()
            let temperatureLabel = UILabel()
            let highLowTemperatureLabel = UILabel()
                        
            placeViewBackGround.do {
                $0.setImage(ImageLiterals.imgBackGround.imgQuarterBackground, for: .normal)
                $0.contentVerticalAlignment = .fill
                $0.contentHorizontalAlignment = .fill
                $0.addTarget(self, action: #selector(backGroundTapped), for: .touchUpInside)
            }
            
            myPlaceLabel.do {
                $0.text = StringLiterals.information.myPlace
                $0.textColor = .white
                $0.font = .displayBold(ofSize: 24)
            }
            
            placeLabel.do {
                $0.text = dummy[i].place
                $0.textColor = .white
                $0.font = .displayMedium(ofSize: 17)
            }
            
            weatherLabel.do {
                $0.text = dummy[i].weather
                $0.textColor = .white
                $0.font = .displayMedium(ofSize: 16)
            }
            
            temperatureLabel.do {
                $0.text = dummy[i].temperature
                $0.textColor = .white
                $0.font = .displayLight(ofSize: 52)
            }
            
            highLowTemperatureLabel.do {
                $0.text = dummy[i].highLowTemperature
                $0.textColor = .white
                $0.font = .displayMedium(ofSize: 15)
            }
            
            addSubview(placeView)
            
            placeView.addSubviews(placeViewBackGround,
                                  myPlaceLabel,
                                  placeLabel,
                                  weatherLabel,
                                  temperatureLabel,
                                  highLowTemperatureLabel)
            
            placeView.snp.makeConstraints {
                $0.top.equalToSuperview().inset(placeViewTopInset)
                $0.leading.trailing.equalToSuperview()
                $0.height.equalTo(117)
            }
  
            placeViewBackGround.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
            
            myPlaceLabel.snp.makeConstraints {
                $0.top.equalToSuperview().inset(10.adjusted)
                $0.leading.equalToSuperview().inset(16.adjusted)
            }
            
            placeLabel.snp.makeConstraints {
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
            
            placeViewTopInset += 133
        }
        

    }
    
    @objc
    func backGroundTapped() {
        delegate?.backGroundTapped()
    }
    
}

