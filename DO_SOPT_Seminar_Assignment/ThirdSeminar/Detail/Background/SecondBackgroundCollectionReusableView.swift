//
//  SecondBackgroundCollectionReusableView.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/11/05.
//

import UIKit

import SnapKit
import Then

final class SecondBackgroundCollectionReusableView: UICollectionReusableView {
    private let backgroundView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundView.do {
            $0.backgroundColor = UIColor(hexCode: "#212832")
            $0.makeCornerRound(radius: 15.adjusted)
        }
        addSubview(backgroundView)

        backgroundView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(680.adjusted)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
