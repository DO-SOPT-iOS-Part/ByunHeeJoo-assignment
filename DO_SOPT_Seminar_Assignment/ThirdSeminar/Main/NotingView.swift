//
//  NotingView.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/11/04.
//


import UIKit

import SnapKit
import Then

// MARK: - Main 화면에서 검색결과가 없을 때 나타나는 View

final class NotingView: UIView {
    
    private let searchIcon = UIImageView()
    private let notingLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setView() {
        self.backgroundColor = .black
        
        searchIcon.do {
            $0.image = ImageLiterals.icon.icSearch
        }
        
        notingLabel.do {
            $0.text = "결과 없음"
            $0.textColor = .white
            $0.font = .displayMedium(ofSize: 25)
        }
        
        self.addSubviews(searchIcon, notingLabel)
        
        searchIcon.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(70.adjusted)
        }
        
        notingLabel.snp.makeConstraints {
            $0.top.equalTo(searchIcon.snp.bottom).offset(5.adjusted)
            $0.centerX.equalToSuperview()
        }
    }
}
