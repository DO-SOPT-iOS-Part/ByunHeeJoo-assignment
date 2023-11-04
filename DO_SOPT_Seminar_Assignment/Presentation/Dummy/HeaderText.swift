//
//  HeaderText.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/11/04.
//

import UIKit

struct HeaderText {
    let icon: UIImage
    let discription: String
}

extension HeaderText {
    static func dummy() -> [HeaderText] {
        return [HeaderText(icon: ImageLiterals.icon.icClock
                           ,discription: StringLiterals.information.firstDiscription),
                HeaderText(icon: ImageLiterals.icon.icCalendar,
                           discription: StringLiterals.information.secondDiscription)]
    }
}
