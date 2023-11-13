//
//  String+.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/11/09.
//

import Foundation

extension String {
    func splitLastString() -> (String, String) {
        guard let lastCharacter = self.last else {
            // 빈 문자열 또는 문자가 없을 경우 처리
            return ("", "")
        }

        let lastIndex = self.index(before: self.endIndex)
        let substring = self.prefix(upTo: lastIndex)
        let lastCharacterString = String(lastCharacter)

        return (String(substring), lastCharacterString)
    }
}
