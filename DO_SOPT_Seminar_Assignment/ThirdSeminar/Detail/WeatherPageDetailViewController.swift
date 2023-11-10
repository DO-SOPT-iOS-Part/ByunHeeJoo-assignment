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
    
    private let firstDummy = WeatherDetail.dummy()
    private let secondDummy = WeatherDetailOfWeek.dummy()
    private var isScrolled: Bool = false
    
    private let backGroundView = UIView()
    private let backGroundImage = UIImageView()
    
    private let navigationPlace = UILabel()
    private let navigationWeather = UILabel()
    private var navigationAnimator: UIViewPropertyAnimator?
    
    var placeLabel: String = ""
    var weatherLabel: String = ""
    var temperatureLabel: String = ""
    var highLowTemperatureLabel: String = ""
    
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
        setRegister()
    }
    
    private func setStyle() {
        backGroundImage.do {
            $0.image = ImageLiterals.imgBackGround.imgFullBackground
        }
        
        collectionView.do {
            $0.makeCornerRound(radius: 15.adjusted)
            $0.isScrollEnabled = true
            $0.showsHorizontalScrollIndicator = false
            $0.showsVerticalScrollIndicator = false
            $0.backgroundColor = .clear
            $0.alwaysBounceVertical = true
            $0.isUserInteractionEnabled = true
            $0.delegate = self
            $0.dataSource = self
        }
        
        divisionLine.do {
            $0.layer.addBorder([.top], color: UIColor.gray, width: 0.8)
            $0.backgroundColor = UIColor(hexCode: "#212832")
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
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(34.adjusted)
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
    
    private func setRegister() {
        collectionView.register(InformationCollectionViewCell.self, forCellWithReuseIdentifier: InformationCollectionViewCell.className)
        collectionView.register(DayOfWeatherCollectionViewCell.self, forCellWithReuseIdentifier: DayOfWeatherCollectionViewCell.className)
        collectionView.register(WeekOfWeatherCollectionViewCell.self, forCellWithReuseIdentifier: WeekOfWeatherCollectionViewCell.className)
        collectionView.register(WeatherDetailHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: WeatherDetailHeaderCollectionReusableView.className)
        collectionView.register(InformationCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: InformationCollectionReusableView.className)
        collectionView.register(FooterCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterCollectionReusableView.className)
        layout.register(FirstBackgroundCollectionReusableView.self, forDecorationViewOfKind: "sectionOneBackground")
        layout.register(SecondBackgroundCollectionReusableView.self, forDecorationViewOfKind: "sectionTwoBackground")
    }
    
    @objc
    func popButtonTapped() {
        if let navigationBar = self.navigationController?.navigationBar {
            for subview in navigationBar.subviews {
                subview.removeFromSuperview()
            }
        }
        self.navigationController?.popViewController(animated: true)
    }
}

extension WeatherPageDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return MySection.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else if section == 1 {
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
        case .infotmation:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InformationCollectionViewCell.className, for: indexPath) as? InformationCollectionViewCell else { return UICollectionViewCell() }
            cell.configureCell(place: placeLabel, temperature: temperatureLabel, weather: weatherLabel, highLowTemperature: highLowTemperatureLabel)
            return cell
        case .dayOfWeather:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayOfWeatherCollectionViewCell.className, for: indexPath) as? DayOfWeatherCollectionViewCell else { return UICollectionViewCell() }
            let weatherDetail = firstDummy[indexPath.row]
            cell.configureCell(weather: weatherDetail)
            return cell
        case .weekOfWeather:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeekOfWeatherCollectionViewCell.className, for: indexPath) as? WeekOfWeatherCollectionViewCell else { return UICollectionViewCell() }
            let weatherWeekDetail = secondDummy[indexPath.row]
            cell.configureCell(weather: weatherWeekDetail, index: indexPath.row)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            if indexPath.section == 1 {
                if isScrolled {
                    guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: InformationCollectionReusableView.className, for: indexPath) as? InformationCollectionReusableView else { fatalError() }
                    header.configureHeader(text: HeaderText.dummy()[indexPath.item])
                    return header
                } else {
                    guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: WeatherDetailHeaderCollectionReusableView.className, for: indexPath) as? WeatherDetailHeaderCollectionReusableView else { fatalError() }
                    return header
                }
            } else if indexPath.section == 2 {
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: InformationCollectionReusableView.className, for: indexPath) as? InformationCollectionReusableView else { fatalError() }
                header.configureHeader(text: HeaderText.dummy()[indexPath.section - 1])
                return header
            } else {
                return  UICollectionReusableView()
            }
        case UICollectionView.elementKindSectionFooter:
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FooterCollectionReusableView.className, for: indexPath)
            return footer
        default:
            return UICollectionReusableView()
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        
        if offsetY < 240 {
            if offsetY < 20 {
                isScrolled = false
                collectionView.reloadData()
            }
        }
        
        if offsetY > 230 {
            if navigationAnimator == nil {
                // moreButton을 찾아 제거
                if let moreButton = navigationController?.navigationBar.subviews.first(where: { $0 is UIButton }) {
                    moreButton.removeFromSuperview()
                }
                navigationController?.navigationBar.isHidden = false
                
                navigationPlace.do {
                    $0.text = placeLabel
                    $0.textColor = .white
                    $0.font = .displayMedium(ofSize: 36)
                }
                navigationWeather.do {
                    $0.text = temperatureLabel + "  |  " + weatherLabel
                    $0.textColor = .white
                    $0.font = .displayMedium(ofSize: 20)
                }
                navigationController?.navigationBar.addSubviews(navigationPlace, navigationWeather)
                navigationPlace.snp.makeConstraints {
                    $0.top.equalToSuperview()
                    $0.centerX.equalToSuperview()
                }
                navigationWeather.snp.makeConstraints {
                    $0.top.equalTo(navigationPlace.snp.bottom).offset(5.adjusted)
                    $0.centerX.equalToSuperview()
                }
                
                navigationAnimator = UIViewPropertyAnimator(duration: 0.3, curve: .easeIn) {
                    self.collectionView.snp.remakeConstraints {
                        $0.top.equalTo(self.navigationWeather.snp.bottom).offset(25.adjusted)
                        $0.leading.trailing.equalToSuperview().inset(20.adjusted)
                        $0.bottom.equalToSuperview()
                    }
                    self.view.layoutIfNeeded()
                }
                
                navigationAnimator?.addCompletion { _ in
                    // 애니메이션이 완료된 후에 collectionView의 레이아웃을 변경
                    self.isScrolled = true
                    self.collectionView.reloadData()
                }
                
                navigationAnimator?.startAnimation()
            }
        } else {
            if navigationAnimator != nil {
                navigationAnimator?.stopAnimation(true)
                navigationAnimator = nil
            }
            
            navigationController?.navigationBar.isHidden = true
            collectionView.snp.remakeConstraints {
                $0.top.equalTo(view.safeAreaLayoutGuide).inset(34.adjusted)
                $0.leading.trailing.equalToSuperview().inset(20.adjusted)
                $0.bottom.equalToSuperview()
            }
        }
    }
}
