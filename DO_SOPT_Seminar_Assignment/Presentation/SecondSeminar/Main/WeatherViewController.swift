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
    
    private let dummy = Weather.dummy()
    private var realPageIndex = -1
    private let myScrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: 0, height: 1700))
    
    private let moreButton = UIButton()
    private let titleLabel = UILabel()
    private let searchBar = UISearchBar()
    
    private let myView = WeatherStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        view.backgroundColor = .black
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        myScrollView.do {
            $0.backgroundColor = .clear
            $0.showsVerticalScrollIndicator = false
            $0.isScrollEnabled = true
        }
        
        moreButton.do {
            $0.setImage(ImageLiterals.icon.icMore, for: .normal)
        }
        
        titleLabel.do {
            $0.text = StringLiterals.information.title
            $0.textColor = .white
            $0.font = .displayBold(ofSize: 36)
        }
        
        searchBar.do {
            $0.placeholder = "도시 또는 공항 검색"
            $0.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
            $0.backgroundImage = UIImage()
            $0.makeCornerRound(radius: 10)
            $0.delegate = self
            $0.setImage(ImageLiterals.icon.icSearch, for: UISearchBar.Icon.search, state: .normal)
            if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
                textfield.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
                textfield.attributedPlaceholder = NSAttributedString(string: textfield.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
                textfield.textColor = UIColor.white
                textfield.font = .displayMedium(ofSize: 19)
                if let leftView = textfield.leftView as? UIImageView {
                    leftView.image = leftView.image?.withRenderingMode(.alwaysTemplate)
                    leftView.tintColor = .lightGray
                }
            }
        }
        
        myView.do {
            $0.delegate = self
        }
        
    }
    
    private func setLayout() {
        view.addSubview(myScrollView)
        
        myScrollView.addSubviews(moreButton,
                                 titleLabel,
                                 searchBar,
                                 myView)
        
        myScrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        moreButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8.adjusted)
            $0.leading.equalToSuperview().inset(321.adjusted)
            $0.trailing.equalToSuperview().inset(10.adjusted)
            $0.size.equalTo(44.adjusted)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(53.adjusted)
            $0.leading.equalToSuperview().inset(20.adjusted)
            $0.trailing.equalToSuperview().inset(288.adjusted)
        }
        
        searchBar.snp.makeConstraints {
            $0.top.equalToSuperview().inset(105.adjusted)
            $0.leading.trailing.equalToSuperview().inset(20.adjusted)
            $0.height.equalTo(40.adjusted)
        }
        
        myView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(169.adjusted)
            $0.leading.trailing.equalToSuperview().inset(20.adjusted)
            $0.height.equalTo(950.adjusted)
            $0.bottom.equalToSuperview()
        }
    }
}

extension WeatherViewController: BackGroundButtonAction {
    func backGroundTapped(index: Int) {
        let viewController = PageNavigationController()
        if realPageIndex != -1 {
            viewController.pageIndex = realPageIndex
        } else {
            viewController.pageIndex = index
        }
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

extension WeatherViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            if let index = dummy.firstIndex(where: {
                $0.place.contains(searchText) }) {
                myView.removeFromSuperview()
                myView.showOnlyOneView(index)
                realPageIndex = index
            }
            myScrollView.addSubview(myView)
            myView.snp.makeConstraints {
                $0.top.equalToSuperview().inset(169.adjusted)
                $0.leading.trailing.equalToSuperview().inset(20.adjusted)
            }
        }
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            myView.setView()
            myScrollView.addSubview(myView)
            myView.snp.makeConstraints {
                $0.top.equalToSuperview().inset(169.adjusted)
                $0.leading.trailing.equalToSuperview().inset(20.adjusted)
                $0.height.equalTo(950.adjusted)
                $0.bottom.equalToSuperview()
            }
        }
    }
}
