//
//  WeatherView.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/10/27.
//

import UIKit

import SnapKit
import Then

// MARK: - Delegate Protocol

protocol BackGroundButtonAction: AnyObject {
    func backGroundTapped(index: Int)
}

final class WeatherView: UIView {
    
    private let dummy = DummyWeather.dummy() // 구조체 정보 불러오기
    weak var delegate: BackGroundButtonAction?
    
    // MARK: - UI Component
    
    private var basePlaceView: UIView {
        let view = UIView()
        return view
    }
    
    private var basePlaceViewBackground: UIButton {
        let button = UIButton()
        button.setImage(ImageLiterals.imgBackGround.imgQuarterBackground, for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: #selector(backGroundTapped), for: .touchUpInside)
        return button
    }
    
    private func baseLabel(withText text: String, font: UIFont, textColor: UIColor = .white) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = font
        return label
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 기본 View 설정 함수
    
    func setView() {
        var placeViewTopInset = 0
        
        for i in 0..<7 {
            let placeView = basePlaceView
            let placeViewBackGround = basePlaceViewBackground
            
            let myPlaceLabel = baseLabel(withText: StringLiterals.information.myPlace, font: .displayBold(ofSize: 24))
            let placeLabel = baseLabel(withText: dummy[i].place, font: .displayMedium(ofSize: 17))
            let weatherLabel = baseLabel(withText: dummy[i].weather, font: .displayMedium(ofSize: 16))
            let temperatureLabel = baseLabel(withText: dummy[i].temperature, font: .displayLight(ofSize: 52))
            let highLowTemperatureLabel = baseLabel(withText: dummy[i].highLowTemperature, font: .displayMedium(ofSize: 15))
            
            placeViewBackGround.tag = i
            
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
    
    // MARK: - 검색한 view만 보이게 하는 함수
    
    func showOnlyOneView(_ index: Int) {
        self.subviews.forEach { $0.removeFromSuperview() }
        
        let placeView = basePlaceView
        let placeViewBackGround = basePlaceViewBackground
        
        let myPlaceLabel = baseLabel(withText: StringLiterals.information.myPlace, font: .displayBold(ofSize: 24))
        let placeLabel = baseLabel(withText: dummy[index].place, font: .displayMedium(ofSize: 17))
        let weatherLabel = baseLabel(withText: dummy[index].weather, font: .displayMedium(ofSize: 16))
        let temperatureLabel = baseLabel(withText: dummy[index].temperature, font: .displayLight(ofSize: 52))
        let highLowTemperatureLabel = baseLabel(withText: dummy[index].highLowTemperature, font: .displayMedium(ofSize: 15))
        
        placeViewBackGround.do {
            $0.setImage(ImageLiterals.imgBackGround.imgQuarterBackground, for: .normal)
            $0.contentVerticalAlignment = .fill
            $0.contentHorizontalAlignment = .fill
            $0.addTarget(self, action: #selector(backGroundTapped), for: .touchUpInside)
        }
        
        addSubview(placeView)
        
        placeView.addSubviews(placeViewBackGround,
                              myPlaceLabel,
                              placeLabel,
                              weatherLabel,
                              temperatureLabel,
                              highLowTemperatureLabel)
        
        placeView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(0)
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
        
    }
    
    // MARK: - 뷰 클릭 objc func
    
    @objc func
    backGroundTapped(sender: UIButton) {
        let tappedIndex = sender.tag
        delegate?.backGroundTapped(index: tappedIndex)
    }
}
