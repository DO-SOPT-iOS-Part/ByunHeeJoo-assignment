//
//  WeatherDetailHeaderCollectionReusableView.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/11/04.
//

import UIKit

import SnapKit
import Then

final class WeatherDetailHeaderCollectionReusableView: UICollectionReusableView {
    
    private let textLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHeaderView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        textLabel.text = ""
    }
    
    private func setupHeaderView() {
        textLabel.do {
            $0.text = StringLiterals.information.discription
            $0.textColor = .white
            $0.font = .displayMedium(ofSize: 18)
            $0.numberOfLines = 2
        }
        
        self.addSubview(textLabel)
        textLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10.adjusted)
            $0.centerX.equalToSuperview()
        }
        
    }
}
