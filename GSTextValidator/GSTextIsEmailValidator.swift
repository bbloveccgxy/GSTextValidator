//
//  GSTextIsEmailValidator.swift
//  GSTextValidatorDemo
//
//  Created by gxy on 2017/3/22.
//  Copyright © 2017年 GaoXinYuan. All rights reserved.
//

import Foundation

class GSTextIsEmailValidator : GSTextBaseValidator {
    
    override func validateWith(text: String?) -> Bool {
        if let t = text {
            if !t.isEmpty {
                let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
                let emailtext = NSPredicate(format: regex)
                let passed = emailtext.evaluate(with: t)
                if !passed {
                    self.result = "不是合法邮箱地址"
                    self.length = t.characters.count
                    return false
                }
                return true
            }
            else{return true}
        }
        else{return false}
    }
    
    private let numberSet: CharacterSet = CharacterSet(charactersIn: "0123456789.")
    
    private func isNumber(char:UnicodeScalar) -> Bool {
        return numberSet.contains(char)
    }
}
