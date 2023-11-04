//
//  HeaderText.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/11/04.
//

import UIKit

struct HeaderText {
    let discription: String
}

extension HeaderText {
    static func dummy() -> [HeaderText] {
        return [HeaderText(discription: StringLiterals.information.discription),
                HeaderText(discription: StringLiterals.information.secondDiscription)]
    }
}
