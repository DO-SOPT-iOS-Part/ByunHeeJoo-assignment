//
//  NSObject+.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/11/03.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
