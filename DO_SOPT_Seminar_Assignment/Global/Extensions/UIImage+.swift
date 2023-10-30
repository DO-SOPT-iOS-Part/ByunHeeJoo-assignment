//
//  UIImage+.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/10/17.
//

import UIKit

extension UIImage {
    static func load(named imageName: String) -> UIImage {
        guard let image = UIImage(named: imageName, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        return image
    }
    
    func resize(to size: CGSize) -> UIImage {
        let image = UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
        return image
    }
}
