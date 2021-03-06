//
//  GSTextValidator.swift
//  GSTextValidatorDemo
//
//  Created by gxy on 2017/3/21.
//  Copyright © 2017年 GaoXinYuan. All rights reserved.
//

import Foundation

class GSTextValidator {
    
    class func isEmpty() -> GSTextIsEmptyValidator {
        let validator = GSTextIsEmptyValidator()
        return validator
    }
    
    class func lessThan(length:Int) -> GSTextLessThanValidator {
        let validator = GSTextLessThanValidator()
        validator.length = length
        return validator
    }
    
    class func isNumber() -> GSTextIsNumberValidator {
        let validator = GSTextIsNumberValidator()
        return validator
    }
    
    class func isEmail(length:Int) -> GSTextIsEmailValidator {
        let validator = GSTextIsEmailValidator()
        return validator
    }
    
    class func moreThan(length:Int) -> GSTextMoreThanValidator {
        let validator = GSTextMoreThanValidator()
        return validator
    }
}
