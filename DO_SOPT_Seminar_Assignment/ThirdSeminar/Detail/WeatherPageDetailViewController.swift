//
//  WeatherPageDetailViewController.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/11/04.
//

import UIKit

import SnapKit
import Then

final class WeatherPageDetailViewController: UIViewController {
    
    private let dummy = WeatherDetail.dummy()

    private let backGroundView = UIView()
    private let backGroundImage = UIImageView()
    
    let placeLabel = UILabel()
    let weatherLabel = UILabel()
    let temperatureLabel = UILabel()
    let highLowTemperatureLabel = UILabel()
    
    private let layout = LayoutFactory.create()
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
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
        backGroundImage.do {
            $0.image = ImageLiterals.imgBackGround.imgFullBackground
        }
        
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
        
        collectionView.do {
            $0.isScrollEnabled = true
            $0.showsHorizontalScrollIndicator = false
            $0.showsVerticalScrollIndicator = false
            $0.backgroundColor = .clear
            $0.alwaysBounceVertical = true
            $0.isUserInteractionEnabled = true
            $0.register(DayOfWeatherCollectionViewCell.self, forCellWithReuseIdentifier: DayOfWeatherCollectionViewCell.className)
            $0.register(WeekOfWeatherCollectionViewCell.self, forCellWithReuseIdentifier: WeekOfWeatherCollectionViewCell.className)
            $0.register(WeatherDetailHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: WeatherDetailHeaderCollectionReusableView.className)
            $0.delegate = self
            $0.dataSource = self
        }
        
        layout.do {
            $0.register(BackgroundCollectionReusableView.self, forDecorationViewOfKind: "sectionOneBackground")
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
        view.addSubview(backGroundView)
        backGroundView.addSubviews(backGroundImage,
                                   placeLabel,
                                   temperatureLabel,
                                   weatherLabel,
                                   highLowTemperatureLabel,
                                   collectionView,
                                   divisionLine,
                                   mapButton,
                                   popButton,
                                   arrowImage,
                                   dotImage)
        
        backGroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        backGroundImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        placeLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(34.adjusted)
            $0.centerX.equalToSuperview()
        }

        temperatureLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(76.adjusted)
            $0.centerX.equalToSuperview()
        }
        
        weatherLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(188.adjusted)
            $0.centerX.equalToSuperview()
        }
        
        highLowTemperatureLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(222.adjusted)
            $0.centerX.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(290.adjusted)
            $0.leading.trailing.equalToSuperview().inset(20.adjusted)
            $0.bottom.equalToSuperview()
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
        
    }
    
    @objc
    func popButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension WeatherPageDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return MySection.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return WeatherDetail.dummy().count
        } else {
            return WeatherDetailOfWeek.dummy().count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let sectionType = MySection(rawValue: indexPath.section) else {
            print("Wrong Section !")
            return UICollectionViewCell()
        }
        switch sectionType {
        case .dayOfWeather:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayOfWeatherCollectionViewCell.className, for: indexPath) as? DayOfWeatherCollectionViewCell else { return UICollectionViewCell() }
            let weatherDetail = dummy[indexPath.row]
            cell.configureCell(weather: weatherDetail)
            return cell
        case .weekOfWeather:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeekOfWeatherCollectionViewCell.className, for: indexPath) as? WeekOfWeatherCollectionViewCell else { return UICollectionViewCell() }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: WeatherDetailHeaderCollectionReusableView.className, for: indexPath) as? WeatherDetailHeaderCollectionReusableView else { fatalError() }
            header.configureHeader(text: HeaderText.dummy()[indexPath.row])
            return header
        default:
            return UICollectionReusableView()
        }
    }

}
