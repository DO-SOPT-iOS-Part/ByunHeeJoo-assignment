//
//  MainWeatherViewController.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/11/03.
//

import UIKit

import SnapKit
import Then

final class MainWeatherViewController: UIViewController {

    private let dummy = Weather.dummy()

    private let mainSearchController = UISearchController(searchResultsController: nil)
    private let moreButton = UIButton()
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.compositionalLayout)
    
    private let compositionalLayout: UICollectionViewCompositionalLayout = {
        // 1. 아이템 크기 설정
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(117.adjusted)) // 아이템 높이를 117로 고정

        let fullPhotoItem = NSCollectionLayoutItem(layoutSize: itemSize)
        fullPhotoItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0) // 아이템 사이의 간격을 16로 설정

        // 2. 그룹 크기 설정
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(7 * (117 + 16))) // 7개의 아이템과 간격을 고려하여 그룹 크기 설정
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitems: [fullPhotoItem])

        // 3. 섹션 설정
        let section = NSCollectionLayoutSection(group: group)

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setStyle()
        setLayout()
    }
    
    private func setNavigationBar() {
        self.navigationItem.searchController = mainSearchController
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.hidesSearchBarWhenScrolling = false
        
        let attributedString = NSMutableAttributedString(string: "날씨", attributes: [
               NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Bold", size: 36) as Any,
               NSAttributedString.Key.foregroundColor: UIColor(white: 255/255, alpha: 1)
           ])
        self.navigationItem.title = attributedString.string
    }
    
    private func setStyle() {
        mainSearchController.do {
            let attributedString = NSMutableAttributedString(string: "도시 또는 공항 검색", attributes: [
                   NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Medium", size: 19) as Any,
                   NSAttributedString.Key.foregroundColor: UIColor(white: 255/255, alpha: 0.3)
               ])
            $0.searchBar.searchTextField.attributedPlaceholder = attributedString
            $0.automaticallyShowsCancelButton = false
            if let searchIconView = $0.searchBar.searchTextField.leftView as? UIImageView {
                    searchIconView.image = searchIconView.image?.withRenderingMode(.alwaysTemplate)
                    searchIconView.tintColor = UIColor(white: 255/255, alpha: 0.3)
            }
            $0.searchBar.searchTextField.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
            setNavigationBar()
        }
        
        moreButton.do {
            $0.setImage(ImageLiterals.icon.icMore, for: .normal)
        }
        
        collectionView.do {
            $0.isScrollEnabled = true
            $0.showsHorizontalScrollIndicator = false
            $0.showsVerticalScrollIndicator = false
            $0.contentInset = UIEdgeInsets.zero
            $0.backgroundColor = UIColor.clear
            $0.clipsToBounds = true
            $0.register(MainWeatherCollectionViewCell.self, forCellWithReuseIdentifier: MainWeatherCollectionViewCell.className)
            $0.dataSource = self
        }
    }
    
    private func setLayout() {
        navigationController?.navigationBar.addSubview(moreButton)
        moreButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8.adjusted)
            $0.leading.equalToSuperview().inset(321.adjusted)
            $0.trailing.equalToSuperview().inset(10.adjusted)
            $0.size.equalTo(44.adjusted)
        }
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(15)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
        }
    }
}

extension MainWeatherViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainWeatherCollectionViewCell.className, for: indexPath) as? MainWeatherCollectionViewCell else { return UICollectionViewCell() }
        let weatherText = dummy[indexPath.row]
        cell.configureCell(weather: weatherText)
        return cell
    }
}
