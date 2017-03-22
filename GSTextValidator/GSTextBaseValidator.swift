//
//  GSTextBaseValidator.swift
//  GSTextValidatorDemo
//
//  Created by gxy on 2017/3/20.
//  Copyright © 2017年 GaoXinYuan. All rights reserved.
//

import Foundation

class GSTextBaseValidator {
    var length: Int?
    var result: String?
    init() {
    }
    func validateWith(text : String?) -> Bool {
        let excp = NSException(name: NSExceptionName.init("GGTextValidator Error"), reason: "func validateWith(text:String) -> Bool shoule be overrided in subclass", userInfo: nil)
        excp.raise()
        return false
    }
}
