//
//  GSTextMoreThanValidator.swift
//  GSTextValidatorDemo
//
//  Created by gxy on 2017/3/21.
//  Copyright © 2017年 GaoXinYuan. All rights reserved.
//

import Foundation

class GSTextMoreThanValidator : GSTextBaseValidator {
    
    override func validateWith(text: String?) -> Bool {
        if let t = text {
            if t.characters.count < self.length! {
                self.result = "应多于\(self.length!)个字"
                return false
            }
            else{return true}
        }
        else{return false}
    }
}
