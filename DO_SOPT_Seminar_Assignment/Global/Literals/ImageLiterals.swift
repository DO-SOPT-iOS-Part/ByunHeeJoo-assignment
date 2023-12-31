//
//  image.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/10/17.
//

import UIKit

enum ImageLiterals {
    enum imgBackGround {
        static var imgFullBackground: UIImage { .load(named: "imgFullBackground")}
        static var imgQuarterBackground: UIImage { .load(named: "imgQuarterBackground")}
    }
    
    enum icon {
        static var icArrow: UIImage { .load(named: "icArrow")}
        static var icCloud: UIImage { .load(named: "icCloud")}
        static var icDot: UIImage { .load(named: "icDot")}
        static var icFoxRain: UIImage { .load(named: "icFoxRain")}
        static var icLightning: UIImage { .load(named: "icLightning")}
        static var icLittleRain: UIImage { .load(named: "icLittleRain")}
        static var icLotOfRain: UIImage { .load(named: "icLotOfRain")}
        static var icSun: UIImage {UIImage(systemName: "sun.max.fill")!.withRenderingMode(.alwaysOriginal)}
        static var icSunCloud: UIImage {UIImage(systemName: "cloud.sun.fill")!.withRenderingMode(.alwaysOriginal)}
        static var icSoCloud: UIImage {UIImage(systemName: "cloud.fill")!.withRenderingMode(.alwaysOriginal)}
        static var icSnow: UIImage {UIImage(systemName: "snowflake")!.withRenderingMode(.alwaysOriginal)}
        static var icWind: UIImage {UIImage(systemName: "wind")!.withRenderingMode(.alwaysOriginal)}
        static var icMap: UIImage { .load(named: "icMap")}
        static var icMore: UIImage { .load(named: "icMore")}
        static var icPop: UIImage { .load(named: "icPop")}
        static var icSearch: UIImage { .load(named: "icSearch")}
        static var icCalendar: UIImage { .load(named: "icCalendar")}
        static var icClock: UIImage { .load(named: "icClock")}
        static var whiteDot: UIImage { .load(named: "whiteDot")}
    }
}
