//
//  WeatherDetailViewController.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/10/26.
//

import UIKit

import SnapKit
import Then

final class WeatherDetailFirstViewController: UIViewController {

    private let myScrollView = UIScrollView()
    private var contentView = UIView()
    
    private let backGroundImage = UIImageView()
    
    private let firstPlaceLabel = UILabel()
    private let firstWeatherLabel = UILabel()
    private let firstTemperatureLabel = UILabel()
    private let firstHighLowTemperatureLabel = UILabel()
    
    private let timeLineBorder = UIView()
    private let discriptionLabel = UILabel()
    private let weatherScrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: 1000, height: 0))
    private let weatherContentView = WeatherContentView()
    
    private let divisionLine = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 0))
    private let mapButton = UIButton()
    private let popButton = UIButton()
    private let arrowImage = UIImageView()
    private let dotImage = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        myScrollView.do {
            $0.backgroundColor = .black
            $0.showsVerticalScrollIndicator = false
            $0.contentInsetAdjustmentBehavior = .never
        }
        
        backGroundImage.do {
            $0.image = ImageLiterals.imgBackGround.imgFullBackground
        }
        
        firstPlaceLabel.do {
            $0.text = StringLiterals.firstWeather.firstPlace
            $0.textColor = .white
            $0.font = .displayMedium(ofSize: 36)
        }
        
        firstWeatherLabel.do {
            $0.text = StringLiterals.firstWeather.firstWeather
            $0.textColor = .white
            $0.font = .displayMedium(ofSize: 24)
        }
        
        firstTemperatureLabel.do {
            $0.text = StringLiterals.firstWeather.firstTemperature
            $0.textColor = .white
            $0.font = .displayThin(ofSize: 102)
        }
        
        firstHighLowTemperatureLabel.do {
            $0.text = StringLiterals.firstWeather.firstHighLowTemperature
            $0.textColor = .white
            $0.font = .displayMedium(ofSize: 20)
        }
        
        timeLineBorder.do {
            $0.makeBorder(width: 0.5, color: UIColor(red: 1, green: 1, blue: 1, alpha: 0.25))
            $0.makeCornerRound(radius: 15)
        }
        
        discriptionLabel.do {
            $0.text = StringLiterals.firstWeather.discription
            $0.textColor = .white
            $0.font = .displayMedium(ofSize: 18)
            $0.numberOfLines = 2
        }
        
        weatherScrollView.do {
            $0.backgroundColor = .clear
            $0.showsHorizontalScrollIndicator = false
            $0.isScrollEnabled = true
            $0.layer.addBorder([.top], color: UIColor.gray, width: 0.5)
        }
        
        divisionLine.do {
            $0.layer.addBorder([.top], color: UIColor.gray, width: 0.8)
        }
        
        mapButton.do {
            $0.setImage(ImageLiterals.icon.icMap, for: .normal)
        }
        
        popButton.do {
            $0.setImage(ImageLiterals.icon.icPop, for: .normal)
            $0.addTarget(self, action: #selector(popButtonTapped), for: .touchUpInside)
        }
        
        arrowImage.do {
            $0.image = ImageLiterals.icon.icArrow
        }
        
        dotImage.do {
            $0.image = ImageLiterals.icon.icDot
        }
    }
    
    private func setLayout() {
        view.addSubview(myScrollView)
        myScrollView.addSubview(contentView)
        
        contentView.addSubviews(backGroundImage,
                                firstPlaceLabel,
                                firstWeatherLabel,
                                firstTemperatureLabel,
                                firstHighLowTemperatureLabel,
                                timeLineBorder,
                                divisionLine,
                                mapButton,
                                popButton,
                                arrowImage,
                                dotImage)
    
        timeLineBorder.addSubviews(discriptionLabel,
                                   weatherScrollView)
        
        weatherScrollView.addSubview(weatherContentView)
        
        myScrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalToSuperview()
        }
        
        firstPlaceLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(34.adjusted)
            $0.centerX.equalToSuperview()
        }

        firstTemperatureLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(76.adjusted)
            $0.centerX.equalToSuperview()
        }
        
        firstWeatherLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(188.adjusted)
            $0.centerX.equalToSuperview()
        }
        
        firstHighLowTemperatureLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(222.adjusted)
            $0.centerX.equalToSuperview()
        }
        
        timeLineBorder.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20.adjusted)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(290.adjusted)
            $0.height.equalTo(212.adjusted)
        }
        
        weatherScrollView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(66.adjusted)
            $0.leading.equalToSuperview().inset(14.adjusted)
            $0.trailing.bottom.equalToSuperview()
        }
        
        weatherContentView.snp.makeConstraints {
            $0.edges.height.equalToSuperview()
            $0.width.equalTo(810.adjusted)
            $0.height.equalTo(146.adjusted)
        }
        
        discriptionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10.adjusted)
            $0.centerX.equalToSuperview()
        }
        
        divisionLine.snp.makeConstraints {
            $0.bottom.width.equalToSuperview()
            $0.height.equalTo(82.adjusted)
        }
        
        mapButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(34.adjusted)
            $0.leading.equalToSuperview().inset(10.adjusted)
            $0.size.equalTo(44.adjusted)
        }
        
        popButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(34.adjusted)
            $0.trailing.equalToSuperview().inset(10.adjusted)
            $0.size.equalTo(44.adjusted)
        }
        
        arrowImage.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(44.adjusted)
            $0.centerX.equalToSuperview().offset(-15)
            $0.size.equalTo(24.adjusted)
        }
        
        dotImage.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(44.adjusted)
            $0.centerX.equalToSuperview().offset(15)
            $0.size.equalTo(24.adjusted)
        }
        
        backGroundImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    @objc
    func popButtonTapped() {
        self.navigationController?.popViewController(animated: true)
        
    }
}
