//
//  UIView + Helper.swift
//  ConsoleBitVishank
//
//  Created by Vishank Raghav on 03/11/22.
//

import Foundation
import UIKit

extension UIView {
    func gradientBg() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = AppColors.palette
        gradientLayer.startPoint = CGPoint(x: 0, y: 0) // Top left corner.
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.shouldRasterize = true
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
