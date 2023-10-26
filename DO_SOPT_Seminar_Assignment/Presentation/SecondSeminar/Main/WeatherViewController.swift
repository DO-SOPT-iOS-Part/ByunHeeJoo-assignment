//
//  ViewController.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/10/04.
//

import UIKit

import SnapKit
import Then

final class WeatherViewController: UIViewController {

    private let myScrollView = UIScrollView()
    private var contentView = UIView()

    private let moreButton = UIButton()
    private let titleLabel = UILabel()

    private let myFirstPlaceView = UIView()
    private let placeViewBackGround = UIButton()
    private let myPlaceLabel = UILabel()
    private let firstPlaceLabel = UILabel()
    private let firstWeatherLabel = UILabel()
    private let firstTemperatureLabel = UILabel()
    private let firstHighLowTemperatureLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
    }

    private func setStyle() {
        view.backgroundColor = .black
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        myScrollView.do {
            $0.backgroundColor = .black
            $0.showsVerticalScrollIndicator = false
        }
        
        moreButton.do {
            $0.setImage(ImageLiterals.icon.icMore, for: .normal)
        }
        
        titleLabel.do {
            $0.text = StringLiterals.firstWeather.title
            $0.textColor = .white
            $0.font = .displayBold(ofSize: 36)
        }
        
        placeViewBackGround.do {
            $0.setImage(ImageLiterals.imgBackGround.imgQuarterBackground, for: .normal)
            $0.contentVerticalAlignment = .fill
            $0.contentHorizontalAlignment = .fill
            $0.addTarget(self, action: #selector(backGroundTapped), for: .touchUpInside)
        }
        
        myPlaceLabel.do {
            $0.text = StringLiterals.firstWeather.myPlace
            $0.textColor = .white
            $0.font = .displayBold(ofSize: 24)
        }
        
        firstPlaceLabel.do {
            $0.text = StringLiterals.firstWeather.firstPlace
            $0.textColor = .white
            $0.font = .displayMedium(ofSize: 17)
        }
        
        firstWeatherLabel.do {
            $0.text = StringLiterals.firstWeather.firstWeather
            $0.textColor = .white
            $0.font = .displayMedium(ofSize: 16)
        }
        
        firstTemperatureLabel.do {
            $0.text = StringLiterals.firstWeather.firstTemperature
            $0.textColor = .white
            $0.font = .displayLight(ofSize: 52)
        }
        
        firstHighLowTemperatureLabel.do {
            $0.text = StringLiterals.firstWeather.firstHighLowTemperature
            $0.textColor = .white
            $0.font = .displayMedium(ofSize: 15)
        }

    }
    
    private func setLayout() {
        view.addSubview(myScrollView)
        myScrollView.addSubview(contentView)
        
        contentView.addSubviews(moreButton,
                                titleLabel,
                                myFirstPlaceView)
        
        myFirstPlaceView.addSubviews(placeViewBackGround,
                                     myPlaceLabel,
                                     firstPlaceLabel,
                                     firstWeatherLabel,
                                     firstTemperatureLabel,
                                     firstHighLowTemperatureLabel)
        
        myScrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalToSuperview()
        }
        
        moreButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(8.adjusted)
            $0.trailing.equalToSuperview().inset(10.adjusted)
            $0.size.equalTo(44.adjusted)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(53.adjusted)
            $0.leading.equalToSuperview().inset(20.adjusted)
        }
        
        myFirstPlaceView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(160.adjusted)
            $0.leading.trailing.equalToSuperview().inset(20.adjusted)
            $0.height.equalTo(117.adjusted)
        }
        
        placeViewBackGround.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        myPlaceLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10.adjusted)
            $0.leading.equalToSuperview().inset(16.adjusted)
        }
        
        firstPlaceLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(44.adjusted)
            $0.leading.equalToSuperview().inset(16.adjusted)
        }
        
        firstWeatherLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10.adjusted)
            $0.leading.equalToSuperview().inset(16.adjusted)
        }
        
        firstTemperatureLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(4.adjusted)
            $0.trailing.equalToSuperview().inset(16.adjusted)
        }
        
        firstHighLowTemperatureLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16.adjusted)
            $0.bottom.equalToSuperview().inset(10.adjusted)
        }
    }
    
    @objc
    func backGroundTapped() {
        let viewController = PageNavigationController()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
