//
//  MainFooterCollectionReusableView.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/11/03.
//

import UIKit

import SnapKit
import Then

final class FooterCollectionReusableView: UICollectionReusableView {
    private let footerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupFooterView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupFooterView() {
        let discription = UILabel()
        discription.text = StringLiterals.information.bottomDiscription
        discription.setUnderline(range: NSRange(location: 0, length: 6))
        discription.setUnderline(range: NSRange(location: 9, length: 6))
        discription.textColor = UIColor(white: 255/255, alpha: 0.7)
        discription.font = .displayMedium(ofSize: 13)
        
        addSubview(footerView)
        footerView.addSubview(discription)

        footerView.backgroundColor = .clear
        
        footerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        discription.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20.adjusted)
            $0.centerX.equalToSuperview()
        }
    }
}
