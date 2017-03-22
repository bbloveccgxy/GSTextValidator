//
//  GSTextField.swift
//  GSTextValidatorDemo
//
//  Created by gxy on 2017/3/20.
//  Copyright © 2017年 GaoXinYuan. All rights reserved.
//

import UIKit

protocol GSTextFieldDelegate : class {
    
    /// called after validate,maybe after didEndEditing or during entering
    ///
    /// - Parameters:
    ///   - result: if not verified, this will contain the reason
    ///   - length: the validated text length
    ///   - description: GSTextField validateDescription
    func textFieldDidEndValidate(result: String, length: Int, description: String?)
}

class GSTextField: UITextField,UITextFieldDelegate {
    
    //MARK:Override init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ///GSTextFieldDelegate
    weak open var gsDelegate: GSTextFieldDelegate?
    
    ///a string of the textField's description, which could be used in delegate func
    var validateDescription : String?
    
    
    /// Add validator(s) to the textField
    ///
    /// - Parameter validators: validator which is the subClass of GSTextBaseValidator
    func add(validators : GSTextBaseValidator...) -> Void {
        for item in validators {
            if item is GSTextLessThanValidator {
                self.lessThanValidator = item as? GSTextLessThanValidator
            }
            else {
                self.validatorArray.append(item)
            }
        }
    }
    
    //MARK:UITextField Delegate
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if self.gsDelegate != nil {
            for validator in self.validatorArray {
                if !validator.validateWith(text: textField.text) {
                    self.gsDelegate?.textFieldDidEndValidate(result: validator.result!, length: validator.length!, description: self.validateDescription)
                }
            }
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if self.gsDelegate != nil {
            if let validator = self.lessThanValidator{
                var validateText:String?
                if let text = textField.text {
                    validateText = text + string
                }
                else {
                    validateText = string
                }
                
                if !validator.validateWith(text: validateText) {
                    self.gsDelegate?.textFieldDidEndValidate(result: validator.result!, length: validator.length!, description: self.validateDescription)
                    
                    return false
                }
            }
        }
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    //MARK: private variable
    private lazy var validatorArray : [GSTextBaseValidator] = []
    private lazy var lessThanValidator : GSTextLessThanValidator? = nil

}
