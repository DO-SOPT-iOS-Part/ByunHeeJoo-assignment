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
    private lazy var collectionView = UICollectionView(frame: .zero,
                                                       collectionViewLayout: flowLayout)
    private let flowLayout = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()
        setStyle()
        setLayout()
    }
    
    private func setNavigationBar() {
        self.navigationItem.searchController = mainSearchController
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.title = "날씨"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.barTintColor = UIColor(white: 55/255, alpha: 0.1)
    }
    
    private func setStyle() {
        mainSearchController.do {
            let attributedString = NSMutableAttributedString(string: "도시 또는 공항 검색", attributes: [
                   NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Medium", size: 19) as Any,
                   NSAttributedString.Key.foregroundColor: UIColor(white: 255/255, alpha: 0.5)
               ])
            $0.searchBar.searchTextField.attributedPlaceholder = attributedString
            $0.automaticallyShowsCancelButton = false
            if let searchIconView = $0.searchBar.searchTextField.leftView as? UIImageView {
                    searchIconView.image = searchIconView.image?.withRenderingMode(.alwaysTemplate)
                    searchIconView.tintColor = UIColor(white: 255/255, alpha: 0.5)
            }
            $0.searchBar.searchTextField.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
        }
        
        moreButton.do {
            $0.setImage(ImageLiterals.icon.icMore, for: .normal)
        }
        
        collectionView.do {
            $0.isScrollEnabled = true
            $0.showsHorizontalScrollIndicator = false
            $0.showsVerticalScrollIndicator = false
            $0.backgroundColor = .clear
            $0.alwaysBounceVertical = true
            $0.register(MainWeatherCollectionViewCell.self, forCellWithReuseIdentifier: MainWeatherCollectionViewCell.className)
            $0.register(MainFooterCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: MainFooterCollectionReusableView.className)
            $0.delegate = self
            $0.dataSource = self
        }
        
        flowLayout.do {
            $0.itemSize = CGSize(width: 335.adjusted, height: 117.adjusted)
            $0.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            $0.minimumLineSpacing = 16
            $0.minimumInteritemSpacing = 0
            $0.scrollDirection = .vertical
            $0.estimatedItemSize = .zero
        }
    
    }
    
    private func setLayout() {
        
        navigationController?.navigationBar.addSubview(moreButton)
        moreButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(321.adjusted)
            $0.trailing.equalToSuperview().inset(10.adjusted)
            $0.size.equalTo(44.adjusted)
        }
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview().inset(20.adjusted)
            $0.bottom.equalToSuperview()
        }
    }
}

extension MainWeatherViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionFooter {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MainFooterCollectionReusableView.className, for: indexPath)
            return footer
        } else {
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 50.adjusted)
    }
}

extension MainWeatherViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        dump(searchController.searchBar.text)
    }
}
