//
//  BackgroundCollectionReusableView.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/11/04.
//

import UIKit

import SnapKit
import Then

final class BackgroundCollectionReusableView: UICollectionReusableView {
    private let backgroundView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundView.do {
            $0.backgroundColor = UIColor(red: 20/255, green: 30/255, blue: 40/255, alpha: 1)
            $0.makeCornerRound(radius: 15.adjusted)
        }
        addSubview(backgroundView)

        backgroundView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
