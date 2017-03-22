//
//  GSTextIsNumberValidator.swift
//  GSTextValidatorDemo
//
//  Created by gxy on 2017/3/22.
//  Copyright © 2017年 GaoXinYuan. All rights reserved.
//

import Foundation

class GSTextIsNumberValidator : GSTextBaseValidator {
    
    override func validateWith(text: String?) -> Bool {
        if let t = text {
            
            if !t.isEmpty {
                for char in t.unicodeScalars {
                    let passed = self.isNumber(char: char)
                    if !passed {
                        self.result = "应全为数字"
                        self.length = t.characters.count
                        return false
                    }
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
