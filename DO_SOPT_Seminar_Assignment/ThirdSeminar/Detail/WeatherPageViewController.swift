//
//  WeatherPageViewController.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/11/04.
//

import UIKit

import SnapKit
import Then

// MARK: - WeatherPageDetailViewController 들이 담긴 PageViewController

final class WeatherPageViewController: UIViewController {
    
    var pageIndex = 0
    var cityWeather: [CityWeatherDataModel] = []

    private lazy var dataViewControllers: [UIViewController] = {
        var viewControllers: [WeatherPageDetailViewController] = []
        
        for i in cityWeather {
            let vc = WeatherPageDetailViewController()
            vc.placeLabel = CityName(rawValue: i.cityName)?.description ?? ""
            vc.temperatureLabel = String(Int(i.currentTemperature)) + "°"
            vc.weatherLabel = CityWeather(rawValue: i.currentWeather)?.description ?? ""
            vc.highLowTemperatureLabel = "최고:" + String(Int(i.highTemperature)) + "° " + " 최저:" + String(Int(i.lowTemperauture)) + "°"
            viewControllers.append(vc)
        }
        return viewControllers
    }()
    
    private lazy var pageViewController: UIPageViewController = {
        let vc = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
        setDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
        self.navigationItem.hidesBackButton = true
    }
    
    private func setStyle() {
        let startingViewController = dataViewControllers[pageIndex]
        pageViewController.setViewControllers([startingViewController], direction: .forward, animated: false, completion: nil)
    }
    
    private func setLayout() {
        addChild(pageViewController)
        view.addSubviews(pageViewController.view)
        
        pageViewController.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        pageViewController.didMove(toParent: self)
    }
    
    private func setDelegate() {
        pageViewController.dataSource = self
        pageViewController.delegate = self
    }
}

extension WeatherPageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = dataViewControllers.firstIndex(of: viewController) else { return nil }
        let previousIndex = index - 1
        if previousIndex < 0 {
            return nil
        }
        return dataViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = dataViewControllers.firstIndex(of: viewController) else { return nil }
        let nextIndex = index + 1
        if nextIndex == dataViewControllers.count {
            return nil
        }
        return dataViewControllers[nextIndex]
    }
}
