//
//  InformationCollectionReusableView.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/11/05.
//

import UIKit

import SnapKit
import Then

// MARK: - One Line Header

final class InformationCollectionReusableView: UICollectionReusableView {
    private let headerIcon = UIImageView()
    private let textLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHeaderView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHeaderView() {
        self.backgroundColor = UIColor(hexCode: "#212832")
        self.makeCornerRound(radius: 15.adjusted)
        self.clipsToBounds = true

        textLabel.do {
            $0.textColor = .darkGray
            $0.font = .displayMedium(ofSize: 15)
            $0.numberOfLines = 2
        }
        
        self.addSubviews(headerIcon, textLabel)
        headerIcon.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8.adjusted)
            $0.leading.equalToSuperview().inset(3.adjusted)
            $0.size.equalTo(24.adjusted)
        }
        textLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(11.adjusted)
            $0.leading.equalTo(headerIcon.snp.trailing).offset(5.adjusted)
        }
    }
    
    func configureHeader(text: HeaderText) {
        headerIcon.image = text.icon
        textLabel.text = text.discription
    }
}
