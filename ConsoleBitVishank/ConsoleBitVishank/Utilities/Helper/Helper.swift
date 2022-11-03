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
}
