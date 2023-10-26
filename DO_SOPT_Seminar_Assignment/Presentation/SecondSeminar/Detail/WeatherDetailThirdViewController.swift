//
//  ThirdDetailViewController.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/10/26.
//

import UIKit

import SnapKit
import Then

final class WeatherDetailThirdViewController: UIViewController {

    private let myScrollView = UIScrollView()
    private var contentView = UIView()
    
    private let backGroundImage = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        myScrollView.do {
            $0.backgroundColor = .black
            $0.showsVerticalScrollIndicator = false
            $0.contentInsetAdjustmentBehavior = .never
        }
        
        backGroundImage.do {
            $0.image = ImageLiterals.imgBackGround.imgFullBackground
        }
    }
    
    private func setLayout() {
        view.addSubview(myScrollView)
        myScrollView.addSubview(contentView)
        
        contentView.addSubviews(backGroundImage)
        
        myScrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalToSuperview()
        }
        
        backGroundImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

}
