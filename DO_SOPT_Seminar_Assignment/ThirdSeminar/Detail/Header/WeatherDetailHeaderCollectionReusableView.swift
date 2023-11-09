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
    
    private func setupHeaderView() {
        self.backgroundColor = UIColor(red: 20/255, green: 30/255, blue: 40/255, alpha: 1)
        self.makeCornerRound(radius: 15.adjusted)
        
        textLabel.do {
            $0.text = StringLiterals.information.discription
            $0.textColor = .white
            $0.font = .displayMedium(ofSize: 16)
            $0.numberOfLines = 2
        }
        
        self.addSubviews(textLabel)
        textLabel.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview().inset(10.adjusted)
            $0.centerX.equalToSuperview()
        }
        
    }
}
