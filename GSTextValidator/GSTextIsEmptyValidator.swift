//
//  GSTextIsEmptyValidator.swift
//  GSTextValidatorDemo
//
//  Created by gxy on 2017/3/20.
//  Copyright © 2017年 GaoXinYuan. All rights reserved.
//

import Foundation

class GSTextIsEmptyValidator: GSTextBaseValidator {
    
    override func validateWith(text: String?) -> Bool {
        if let t = text {
            if  t.isEmpty  {
                self.result = "不能为空"
                self.length = t.characters.count
                return false
            }
            else{return true}
        }
        else{return false}
    }
    
}
