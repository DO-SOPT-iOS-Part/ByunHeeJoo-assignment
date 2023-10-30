//
//  UIFont+.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/10/17.
//

import UIKit

extension UIFont {
    
    static func displayBold(ofSize size: CGFloat) -> UIFont{
        return UIFont(name: "SFProDisplay-Bold", size: size)!
    }
    
    static func displayThin(ofSize size: CGFloat) -> UIFont{
        return UIFont(name: "SFProDisplay-Thin", size: size)!
    }
    
    static func displayRegular(ofSize size: CGFloat) -> UIFont{
        return UIFont(name: "SFProDisplay-Regular", size: size)!
    }
    
    static func displayLight(ofSize size: CGFloat) -> UIFont{
        return UIFont(name: "SFProDisplay-Light", size: size)!
    }
    
    static func displayMedium(ofSize size: CGFloat) -> UIFont{
        return UIFont(name: "SFProDisplay-Medium", size: size)!
    }
}
