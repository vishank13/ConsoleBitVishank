//
//  NSObject + Helper.swift
//  ConsoleBitVishank
//
//  Created by Vishank Raghav on 02/11/22.
//

import Foundation

extension NSObject {
    class var className: String {
        return String(describing: self)
    }
}
