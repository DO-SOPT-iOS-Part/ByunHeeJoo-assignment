//
//  WeatherDetailHeaderCollectionReusableView.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/11/04.
//

import UIKit

import SnapKit
import Then

// MARK: - Two Line Header

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
        self.backgroundColor = UIColor(hexCode: "#212832")
        self.makeCornerRound(radius: 15.adjusted)
        self.clipsToBounds = true

        textLabel.do {
            $0.textColor = .white
            $0.font = .displayMedium(ofSize: 16)
            $0.numberOfLines = 2
        }
        
        self.addSubviews(textLabel)
        textLabel.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview().inset(10.adjusted)
            $0.leading.equalToSuperview().inset(15.adjusted)
        }
        
    }
    
    func configureHeader(text: String) {
        let description = CityWeather(rawValue: text)?.description ?? ""

        let formatter_time = DateFormatter()
        formatter_time.dateFormat = "HH:mm"

        let currentDate = Date()
        let current_time_string = formatter_time.string(from: currentDate)

        if let oneHourLater = Calendar.current.date(byAdding: .hour, value: 1, to: currentDate) {
            let one_hour_later_string = formatter_time.string(from: oneHourLater)
            textLabel.text = current_time_string + " ~ " + one_hour_later_string + " 에 " + description + " 상태가 예상됩니다."
        } else {
            textLabel.text = "상태없음"
        }
    }
}
