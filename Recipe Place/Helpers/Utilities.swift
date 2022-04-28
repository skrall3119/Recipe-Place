//
//  Utilities.swift
//  Recipe Place
//
//  Created by Alex Janci on 4/28/22.
//

import Foundation

class Utilities {
    
    static func isPasswordValid(_ password: String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@",   "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
}
