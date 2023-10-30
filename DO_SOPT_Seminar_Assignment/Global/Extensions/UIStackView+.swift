//
//  UIStackView+.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/10/17.
//

import UIKit

extension UIStackView {
    func addArrangeSubViews(_ views: [UIView]) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
