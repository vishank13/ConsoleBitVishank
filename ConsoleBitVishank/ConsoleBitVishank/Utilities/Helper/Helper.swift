//
//  Helper.swift
//  ConsoleBitVishank
//
//  Created by Vishank Raghav on 03/11/22.
//

import Foundation
import SwiftKeychainWrapper

class Helper {
    
    static func performLogout() {
        UserDefaults.standard.set(false, forKey: AppConstants.loggedIn)
        KeychainWrapper.standard.removeObject(forKey: AppConstants.accessToken)
        print("Logged In?", UserDefaults.standard.bool(forKey: AppConstants.loggedIn))
    }
    
    static func getDateFrom(string: String) -> String {
        if string.isEmpty {
            return string
        }
        let df = DateFormatter()
        df.dateFormat = AppConstants.apiDateFormat
        guard let d = df.date(from: string) else { return string }
        df.dateFormat = AppConstants.appDateFormat
        return df.string(from: d)
    }
}
