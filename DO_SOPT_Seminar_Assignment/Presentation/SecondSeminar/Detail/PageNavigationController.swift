//
//  WeatherDetailViewController.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/10/17.
//

import UIKit

import SnapKit
import Then

// MARK: - PageViewController

final class PageNavigationController: UIViewController {
    
    var pageIndex = 0
    
    private lazy var dataViewControllers: [UIViewController] = {
        var viewControllers: [WeatherDetailViewController] = []
        
        for dummy in Weather.dummy() {
            let vc = WeatherDetailViewController()
            vc.placeLabel.text = dummy.place
            vc.temperatureLabel.text = dummy.temperature
            vc.weatherLabel.text = dummy.weather
            vc.highLowTemperatureLabel.text = dummy.highLowTemperature
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

extension PageNavigationController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
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
