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
    private var array: [String] = []
    private var filteredArray: [String] = []
    private var realPageIndex = -1 // 선택한 index를 -1로 초기 설정
    
    private let mainSearchController = UISearchController(searchResultsController: nil)
    private let moreButton = UIButton()
    private lazy var collectionView = UICollectionView(frame: .zero,
                                                       collectionViewLayout: flowLayout)
    private let flowLayout = UICollectionViewFlowLayout()
    
    private var isFiltering: Bool {
        let searchController = self.navigationItem.searchController
        let isActive = searchController?.isActive ?? false
        let isSearchBarHasText = searchController?.searchBar.text?.isEmpty == false
        return isActive && isSearchBarHasText
    }
    private let notingView = NotingView()
    private let discriptionLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()
        setStyle()
        setLayout()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.hidesBackButton = true
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
        for i in 0..<dummy.count {
            array.append(dummy[i].place)
        }
        
        mainSearchController.do {
            $0.searchResultsUpdater = self
            let attributedString = NSMutableAttributedString(string: "도시 또는 공항 검색", attributes: [
                   NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Medium", size: 19) as Any,
                   NSAttributedString.Key.foregroundColor: UIColor(white: 255/255, alpha: 0.5)
               ])
            $0.searchBar.searchTextField.attributedPlaceholder = attributedString
            $0.automaticallyShowsCancelButton = true
            if let searchIconView = $0.searchBar.searchTextField.leftView as? UIImageView {
                    searchIconView.image = searchIconView.image?.withRenderingMode(.alwaysTemplate)
                    searchIconView.tintColor = UIColor(white: 255/255, alpha: 0.5)
            }
            // clear 버튼 색 변경
            if let button = $0.searchBar.searchTextField.value(forKey: "_clearButton") as? UIButton {
                let templateImage = button.imageView?.image?.withRenderingMode(.alwaysTemplate)
                button.setImage(templateImage, for: .normal)
                button.tintColor = .systemGray
            }
            $0.searchBar.setValue("취소", forKey: "cancelButtonText")
            $0.searchBar.tintColor = .white
            $0.searchBar.searchTextField.textColor = .white
            $0.searchBar.searchTextField.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
            $0.searchBar.delegate = self
            $0.delegate = self
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
            $0.isUserInteractionEnabled = true
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

extension MainWeatherViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.isFiltering ? self.filteredArray.count : self.array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainWeatherCollectionViewCell.className, for: indexPath) as? MainWeatherCollectionViewCell else { return UICollectionViewCell() }
        if self.isFiltering {
            for i in 0..<dummy.count {
                if dummy[i].place == self.filteredArray[indexPath.row] {
                    cell.configureCell(weather: dummy[i], row: indexPath.row)
                    realPageIndex = i
                }
            }
        } else {
            let weatherText = dummy[indexPath.row]
            cell.configureCell(weather: weatherText, row: indexPath.row)
        }
        cell.delegate = self
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

extension MainWeatherViewController: UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        moreButton.isHidden = true
    }
    
    func didDismissSearchController(_ searchController: UISearchController) {
        moreButton.isHidden = false
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        self.filteredArray = self.array.filter { $0.localizedCaseInsensitiveContains(text) }
        
        for subview in notingView.subviews {
            if subview == discriptionLabel {
                subview.removeFromSuperview()
            }
        }
        
        if isFiltering && filteredArray == [] {
            discriptionLabel.do {
                $0.text = "'" + text + "'에 대한 검색 결과가 없습니다."
                $0.textColor = .systemGray
                $0.font = .displayMedium(ofSize: 15)
            }
            view.addSubview(notingView)
            notingView.addSubview(discriptionLabel)
            notingView.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
            discriptionLabel.snp.makeConstraints {
                $0.bottom.equalToSuperview().inset(315.adjusted)
                $0.centerX.equalToSuperview()
            }
        } else {
            notingView.removeFromSuperview()
        }
        collectionView.reloadData()
    }
}

extension MainWeatherViewController: ButtonTouchnAction {
    func backGroundTapped(index: Int) {
        let viewController = PageNavigationController()
        if realPageIndex != -1 {
            viewController.pageIndex = realPageIndex
        } else {
            viewController.pageIndex = index
        }
        self.navigationController?.pushViewController(viewController, animated: true)
        realPageIndex = -1
        mainSearchController.isActive = false
    }
}
