//
//  Date+.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/11/16.
//

import Foundation

extension Date {
    static func convertHourFormat(from dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "HH시"
            let formattedHour = dateFormatter.string(from: date)
            return formattedHour
        } else {
            return nil
        }
    }
}
